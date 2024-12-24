//
//  HighlightIcon.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct HighlightIcon: View {
    @Environment(\.dimensions) var dimensions
    @Environment(\.colors) var colors
    
    let iconName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: dimensions.medium)
        .stroke(
            colors.darkGold,
            lineWidth: dimensions.highlightImageBorderLineWidth
        )
        .fill(colors.gold)
        .frame(
            width: dimensions.highlightImageContainerSize,
            height: dimensions.highlightImageContainerSize
        )
        .overlay(
            Image(iconName)
            .resizable()
            .scaledToFit()
            .frame(
                width: dimensions.highlightImageSize,
                height: dimensions.highlightImageSize
            )
            .padding(dimensions.small)
        )
    }
}

#Preview("Highlight Icon") {
    HighlightIcon(
        iconName: "avocadoIcon"
    )
}
