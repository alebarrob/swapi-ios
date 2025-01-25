//
//  FoodResultScreen.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

import SwiftUI
import Factory
import GoogleMobileAds

struct FoodResultScreen: View {
    @Environment(\.colors) var colors
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    @StateObject private var viewModel: FoodResultViewModel
    
    let container: Container
    @Binding private var path: NavigationPath

    init(
        container: Container,
        path: Binding<NavigationPath>,
        discardedFoodId: Int,
        discardedFoodAmount: String
    ) {
        self.container = container
        _path = path
        _viewModel = StateObject(
            wrappedValue: container.foodResultViewModel((discardedFoodId, discardedFoodAmount))
        )
    }

    var body: some View {
        VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
            switch viewModel.state {
                case .loading:
                    LoadingScreen()

                case .success(
                    let dicardedFood,
                    let discardedFoodAmount,
                    let equivalentFoods
                ):
                    SuccessFoodResultScreen(
                        discardedFood: dicardedFood,
                        discardedFoodAmount: discardedFoodAmount,
                        equivalentFoods: equivalentFoods
                    )
                
                case .ad(let interstitialAd):
                    AdScreen(interstitialAd: interstitialAd)

                case .failure:
                    FailureScreen()
            }
        }
        .onAppear {
            let defaultEquivalentFoodsCount = 0
            let equivalentFoodsCountIncrement = 1
            let maxEquivalentFoodsCount = 5
            let equivalentFoodsCount = UserDefaults.standard.integer(forKey: UserDefaultsKeys.equivalentFoodsCount)
            
            if (equivalentFoodsCount == maxEquivalentFoodsCount) {
                viewModel.onEvent(FoodResultScreenEvent.loadAd)
                UserDefaults.standard.set(
                    defaultEquivalentFoodsCount,
                    forKey: UserDefaultsKeys.equivalentFoodsCount
                )
            } else {
                viewModel.onEvent(FoodResultScreenEvent.loadEquivalentFoods)
                UserDefaults.standard.set(
                    equivalentFoodsCount + equivalentFoodsCountIncrement,
                    forKey: UserDefaultsKeys.equivalentFoodsCount
                )
            }
        }
    }
}

struct SuccessFoodResultScreen: View {
    @Environment(\.colors) var colors
    @Environment(\.dimensions) var dimensions
    
    let discardedFood: FoodVo
    let discardedFoodAmount: String
    let equivalentFoods: [FoodVo]
    
    var body: some View {
        VStack(spacing: dimensions.extraSmall) {
            let firstChunk = Text("¡El resultado está listo! ")
            .foregroundColor(colors.black)
            let secondChunk = Text("\(discardedFoodAmount) \(discardedFood.unit.name) de \(discardedFood.name) ")
            .foregroundColor(colors.red)
            .bold()
            let thirdChunk = Text("equivalen a...")
            .foregroundColor(colors.black)
            
            InformationCard(
                text: {
                    firstChunk + secondChunk + thirdChunk
                },
                decorativeIconName: "wowWatermelonIcon",
                highlightIconName: discardedFood.iconName,
                iconPosition: IconPosition.highlightOnStart
            )
            FoodGrid(
                foods: equivalentFoods,
                onClick: { _ in },
                withResult: true
            )
        }
        .padding(.horizontal, dimensions.medium)
        .padding(.top, -dimensions.informationCardDecorativeImageYOffset)
        .padding(.top, dimensions.medium)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview("Success Food Result Screen") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        SuccessFoodResultScreen(
            discardedFood: FoodVo(
                id: 49,
                name: "Aguacate",
                iconName: "avocadoIcon",
                standardAmount: "50.0",
                equivalentAmount: "45.0",
                category: CategoryVo(
                    id: 3,
                    name: "Grasas",
                    conversionFactor: 50.0
                ),
                unit: UnitVo(
                    id: 1,
                    name: "gr."
                )
            ),
            discardedFoodAmount: "30.0",
            equivalentFoods: [
                FoodVo(
                    id: 50,
                    name: "Cacao desgrasado en polvo",
                    iconName: "cocoaPowderIcon",
                    standardAmount: "30.0",
                    equivalentAmount: "10.45",
                    category: CategoryVo(
                        id: 3,
                        name: "Grasas",
                        conversionFactor: 50.0
                    ),
                    unit: UnitVo(
                        id: 1,
                        name: "gr."
                    )
                ),
                FoodVo(
                    id: 51,
                    name: "Coco",
                    iconName: "coconutIcon",
                    standardAmount: "30.0",
                    equivalentAmount: "40.56",
                    category: CategoryVo(
                        id: 3,
                        name: "Grasas",
                        conversionFactor: 50.0
                    ),
                    unit: UnitVo(
                        id: 1,
                        name: "gr."
                    )
                ),
                FoodVo(
                    id: 52,
                    name: "Chocolate negro",
                    iconName: "chocolateIcon",
                    standardAmount: "30.0",
                    equivalentAmount: "5.0",
                    category: CategoryVo(
                        id: 3,
                        name: "Grasas",
                        conversionFactor: 50.0
                    ),
                    unit: UnitVo(
                        id: 1,
                        name: "gr."
                    )
                )
            ]
        )
    }
}

struct AdScreen: View {
    @Environment(\.colors) var colors
    @Environment(\.typography) var typography
    
    let interstitialAd: GADInterstitialAd?

    var body: some View {
        Text("¡Ya casi estamos!")
            .font(typography.body.medium)
            .foregroundColor(colors.black)
            .multilineTextAlignment(.center)
            .onAppear {
                presentAd()
            }
    }
    
    private func presentAd() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            return
        }
        interstitialAd?.present(fromRootViewController: rootViewController)
    }
}
