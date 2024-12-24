//
//  FoodResultViewModel.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

import Foundation
import Combine

class FoodResultViewModel : ObservableObject {
    @Published private(set) var state: FoodResultScreenState = .loading
    private let getFoodById: GetFoodById
    private let getFoodsByCategoryId: GetFoodsByCategoryId
    private let getEquivalentFoods: GetEquivalentFoods
    
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
        
        onEvent(
            FoodResultScreenEvent.loadEquivalentFoods(
                discardedFoodId: discardedFoodId,
                discardedFoodAmount: discardedFoodAmount
            )
        )
    }
    
    func onEvent(_ event: FoodResultScreenEvent) {
        switch event {
        case .loadEquivalentFoods(
            let discardedFoodId,
            let discardedFoodAmount
        ):
            loadEquivalentFoods(
                discardedFoodId: discardedFoodId,
                discardedFoodAmount: discardedFoodAmount
            )
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

                DispatchQueue.main.async { [weak self] in
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
                DispatchQueue.main.async { [weak self] in
                    self?.state = .failure
                }
            }
        }
    }
}
