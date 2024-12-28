//
//  FoodAmountCard.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct FoodAmountCard: View {
    @Environment(\.dimensions) var dimensions
    
    let food: FoodVo
    @Binding var amount: String
    let isError: Bool
    var isFocused: FocusState<Bool>.Binding
    
    var body: some View {
        VStack(spacing: dimensions.foodAmountCardContentSpacing) {
            IconCard(
                text: food.name,
                iconName: food.iconName,
                onClick: {},
                withHightlightIcon: false
            )
            AmountTextField(
                unit: food.unit,
                amount: $amount,
                isError: isError,
                isFocused: isFocused
            )
        }
        .padding(dimensions.medium)
    }
}

#Preview("Food Amount Card") {
    @Previewable @Environment(\.colors) var colors
    @Previewable @State var amount: String = ""
    @Previewable @FocusState var isFocused: Bool
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        FoodAmountCard(
            food: FoodVo(
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
            amount: $amount,
            isError: false,
            isFocused: $isFocused
        )
    }
}
