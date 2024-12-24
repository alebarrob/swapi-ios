//
//  FoodSelectionScreen.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI
import Factory

struct FoodSelectionScreen: View {
    @Environment(\.colors) var colors
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    @StateObject private var viewModel: FoodSelectionViewModel
    
    let container: Container
    @Binding private var path: NavigationPath

    init(
        container: Container,
        path: Binding<NavigationPath>,
        categoryId: Int
    ) {
        self.container = container
        _path = path
        _viewModel = StateObject(wrappedValue: container.foodSelectionViewModel(categoryId))
    }

    var body: some View {
        VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
            switch viewModel.state {
                case .loading:
                    LoadingScreen()

                case .success(let foods):
                    SuccessFoodSelectionScreen(
                        foods: foods,
                        onFoodClick: { foodId in
                            foodId
                        }
                    )

                case .failure:
                    FailureScreen()
            }
        }
        .toolbarBackground(colors.darkGreen, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { path.removeLast() }) {
                    HStack(spacing: dimensions.small) {
                        Image(systemName: "chevron.backward")
                        Text("Volver")
                    }
                    .foregroundColor(colors.white)
                    .font(typography.labels.medium)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { path = NavigationPath() }) {
                    Image(systemName: "house")
                    .foregroundColor(colors.white)
                }
            }
        }
    }
}

struct SuccessFoodSelectionScreen: View {
    @Environment(\.colors) var colors
    @Environment(\.dimensions) var dimensions
    
    let foods: [FoodVo]
    let onFoodClick: (Int) -> Void
    
    var body: some View {
        VStack(spacing: dimensions.extraSmall) {
            InformationCard(
                text: {
                    Text("Ahora elige el alimento que quieres cambiar en tu dieta. El que NO te apetece comer hoy.")
                    .foregroundColor(colors.black)
                },
                decorativeIconName: "questionWatermelonIcon",
                highlightIconName: nil,
                iconPosition: IconPosition.HIGHLIGHT_ON_START
            )
            FoodGrid(
                foods: foods,
                onClick: { foodId in
                    onFoodClick(foodId)
                },
                withResult: false
            )
        }
        .padding(.horizontal, dimensions.large)
        .padding(.top, -dimensions.informationCardDecorativeImageYOffset)
        .padding(.top, dimensions.extraSmall)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview("Success Food Selection Screen") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        SuccessFoodSelectionScreen(
            foods: [
                FoodVo(
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
            ],
            onFoodClick: { _ in }
        )
    }
}
