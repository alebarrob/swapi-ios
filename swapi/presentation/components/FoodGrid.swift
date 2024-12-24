//
//  FoodGrid.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct FoodGrid: View {
    @Environment(\.dimensions) var dimensions
    
    let foods: [FoodVo]
    let onClick: (Int) -> Void
    let withResult: Bool
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: dimensions.iconCardSize))
                ],
                spacing: dimensions.small
            ) {
                ForEach(foods, id: \.id) { food in
                    IconCard(
                        text: withResult ? "\(food.equivalentAmount) \(food.unit.name) de \(food.name)" : food.name,
                        iconName: food.iconName,
                        onClick: {
                            onClick(food.id)
                        },
                        withHightlightIcon: withResult
                    )
                    .padding(.top, withResult ? -dimensions.iconCardHightlightImageYOffset : 0)
                    .padding(.leading, withResult ? -dimensions.iconCardHightlightImageYOffset : 0)
                }
            }
        }
    }
}

#Preview("Food Grid with result") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        FoodGrid(
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
            onClick: { _ in },
            withResult: true
        )
    }
}

#Preview("Food Grid without result") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        FoodGrid(
            foods: [
                FoodVo(
                    id: 49,
                    name: "Aguacate",
                    iconName: "avocadoIcon",
                    standardAmount: "50.0",
                    equivalentAmount: "0.0",
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
            onClick: {_ in },
            withResult: false
        )
    }
}
