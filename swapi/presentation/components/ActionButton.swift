//
//  ActionButton.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

import SwiftUI

struct ActionButton: View {
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    @Environment(\.colors) var colors
    
    let text: String
    let onClick: () -> Void
    
    var body: some View {
        Button(action: onClick) {
            Text(text)
                .font(typography.labels.large)
                .foregroundColor(colors.black)
                .padding(.vertical, dimensions.medium)
                .padding(.horizontal, dimensions.actionButtonHorizontalContentPadding)
                .background(colors.white)
                .cornerRadius(dimensions.actionButtonCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: dimensions.actionButtonCornerRadius)
                        .stroke(
                            colors.darkGreen,
                            lineWidth: dimensions.actionButtonBorderLineWidth
                        )
                )
                .shadow(radius: dimensions.actionButtonCornerRadius)
        }
    }
}

#Preview("Action Button") {
    ActionButton(
        text: "CATEGORÍAS",
        onClick: {}
    )
}
