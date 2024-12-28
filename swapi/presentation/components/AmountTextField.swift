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
    var isFocused: FocusState<Bool>.Binding

    var body: some View {
        TextField(
            "",
            text: $amount,
            prompt: Text(unit.name).foregroundColor(colors.black.opacity(0.4))
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
        .focused(isFocused)
        .keyboardType(.numbersAndPunctuation)
    }
}

#Preview("Amount TextField") {
    @Previewable @Environment(\.colors) var colors
    @Previewable @State var amount: String = ""
    @Previewable @FocusState var isFocused: Bool
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        AmountTextField(
            unit: UnitVo(
                id: 1,
                name: "gr."
            ),
            amount: $amount,
            isError: false,
            isFocused: $isFocused
        )
    }
}

#Preview("Amount TextField Error") {
    @Previewable @Environment(\.colors) var colors
    @Previewable @State var amount: String = ""
    @Previewable @FocusState var isFocused: Bool
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        AmountTextField(
            unit: UnitVo(
                id: 1,
                name: "gr."
            ),
            amount: $amount,
            isError: true,
            isFocused: $isFocused
        )
    }
}

