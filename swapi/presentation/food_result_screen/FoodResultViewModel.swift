//
//  FoodResultViewModel.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

import Foundation
import Combine
import GoogleMobileAds

class FoodResultViewModel : NSObject, GADFullScreenContentDelegate, ObservableObject {
    @Published private(set) var state: FoodResultScreenState = .loading
    private let getFoodById: GetFoodById
    private let getFoodsByCategoryId: GetFoodsByCategoryId
    private let getEquivalentFoods: GetEquivalentFoods
    
    private let discardedFoodId: Int
    private let discardedFoodAmount: String
    
    init(
        getFoodById: GetFoodById,
        getFoodsByCategoryId: GetFoodsByCategoryId,
        getEquivalentFoods: GetEquivalentFoods,
        discardedFoodId: Int,
        discardedFoodAmount: String
    ) {
        self.getFoodById = getFoodById
        self.getFoodsByCategoryId = getFoodsByCategoryId
        self.getEquivalentFoods = getEquivalentFoods
        self.discardedFoodId = discardedFoodId
        self.discardedFoodAmount = discardedFoodAmount
        
        super.init()
    }
    
    func onEvent(_ event: FoodResultScreenEvent) {
        switch event {
        case .loadEquivalentFoods:
            loadEquivalentFoods(
                discardedFoodId: discardedFoodId,
                discardedFoodAmount: discardedFoodAmount
            )
            
        case .loadAd:
            loadAd()
        }
    }
    
    private func loadEquivalentFoods(
        discardedFoodId: Int,
        discardedFoodAmount: String
    ) {
        state = .loading

        guard let discardedFoodAmount = Double(discardedFoodAmount) else {
            state = .failure
            return
        }

        Task {
            do {
                let discardedFood = try await getFoodById.execute(
                    params: GetFoodById.Params(id: discardedFoodId)
                ).get()

                let replacementFoods = try await getFoodsByCategoryId.execute(
                    params: GetFoodsByCategoryId.Params(id: discardedFood.category.id)
                ).get()

                let equivalentFoods = getEquivalentFoods.execute(
                    params: GetEquivalentFoods.Params(
                        discardedFood: discardedFood,
                        discardedFoodAmount: discardedFoodAmount,
                        replacementFoods: replacementFoods
                    )
                )

                await MainActor.run { [weak self] in
                    guard let self = self else { return }
                    
                    self.state = .success(
                        discardedFood: discardedFood.toFoodVo(),
                        discardedFoodAmount: discardedFoodAmount.formatAndRemoveTrailingZeros(),
                        equivalentFoods: equivalentFoods.map { food in
                            food.toFoodVo()
                        }
                    )
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.state = .failure
                }
            }
        }
    }
    
    private func loadAd() {
        state = .loading
        
        Task {
            do {
                let adUnitId = Bundle.main.object(forInfoDictionaryKey: "InterstitialAdId") as? String ?? ""
                let interstitialAd = try await GADInterstitialAd.load(
                    withAdUnitID: adUnitId,
                    request: GADRequest()
                )
                
                interstitialAd.fullScreenContentDelegate = self
                await MainActor.run { [weak self] in
                    self?.state = .ad(interstitialAd: interstitialAd)
                }
            } catch {
                print("Error al cargar el anuncio intersticial: \(error.localizedDescription)")
                await MainActor.run { [weak self] in
                    self?.state = .failure
                }
            }
        }
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
            onEvent(.loadEquivalentFoods)
    }
    
    func ad(
          _ ad: GADFullScreenPresentingAd,
          didFailToPresentFullScreenContentWithError error: Error
    ) {
        onEvent(.loadEquivalentFoods)
    }
}
