//
//  AmountTextField.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

import SwiftUI

struct AmountTextField: View {
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    @Environment(\.colors) var colors
    
    let unit: UnitVo
    @Binding var amount: String
    let isError: Bool
    @FocusState private var isFocused: Bool

    var body: some View {
        TextField(
            unit.name,
            text: $amount
        )
        .padding()
        .background(
            RoundedRectangle(cornerRadius: dimensions.small)
            .fill(Color.white)
            .stroke(
                isError ? colors.red : colors.green,
                lineWidth: dimensions.amountTextFieldBorderLineWidth
            )
        )
        .foregroundColor(colors.black)
        .frame(width: dimensions.amountTextFieldWidth)
        .focused($isFocused)
        .keyboardType(.numbersAndPunctuation)
    }
}

#Preview("Amount TextField") {
    @Previewable @Environment(\.colors) var colors
    @Previewable @State var amount: String = ""
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        AmountTextField(
            unit: UnitVo(
                id: 1,
                name: "gr."
            ),
            amount: $amount,
            isError: false
        )
    }
}

#Preview("Amount TextField Error") {
    @Previewable @Environment(\.colors) var colors
    @Previewable @State var amount: String = ""
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        AmountTextField(
            unit: UnitVo(
                id: 1,
                name: "gr."
            ),
            amount: $amount,
            isError: true
        )
    }
}

