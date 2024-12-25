//
//  IconCard.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct IconCard: View {
    @Environment(\.dimensions) var dimensions
    @Environment(\.colors) var colors
    @Environment(\.typography) var typography
    
    let text: String
    let iconName: String
    let onClick: () -> Void
    let withHightlightIcon: Bool
    
    private let longSentenceLenght = 26
    
    var body: some View {
        VStack(spacing: dimensions.small) {
            if !withHightlightIcon {
                Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(
                    width: dimensions.iconCardIconSize,
                    height: dimensions.iconCardIconSize
                )
            }
            
            Text(text)
            .font(text.count > longSentenceLenght ? typography.labels.small : typography.labels.medium)
            .foregroundColor(colors.black)
            .padding(.horizontal)
            .background(colors.white)
            .multilineTextAlignment(.center)
        }
        .frame(
            width: dimensions.iconCardSize,
            height: dimensions.iconCardSize
        )
        .background(colors.white)
        .cornerRadius(dimensions.large)
        .accessibilityIdentifier(text)
        .overlay(alignment: .topLeading) {
            Group {
                if withHightlightIcon {
                    HighlightIcon(iconName: iconName)
                    .offset(
                        x: dimensions.iconCardHightlightImageXOffset,
                        y: dimensions.iconCardHightlightImageYOffset
                    )
                } else {
                    EmptyView()
                }
            }
        }
        .onTapGesture {
            onClick()
        }
            
    }
}

#Preview("Short text Icon Card without Highlight Icon") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        IconCard(
            text: "Aguacate",
            iconName: "avocadoIcon",
            onClick: {},
            withHightlightIcon: false
        )
    }
}

#Preview("Short text Icon Card with Highlight Icon") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        IconCard(
            text: "2.00 gr. de Aguacate",
            iconName: "avocadoIcon",
            onClick: {},
            withHightlightIcon: true
        )
    }
}

#Preview("Long text Icon Card without Highlight Icon") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        IconCard(
            text: "Puré de patata deshidratado (en polvo)",
            iconName: "potatoPowderIcon",
            onClick: {},
            withHightlightIcon: false
        )
    }
}

#Preview("Long text Icon Card with Highlight Icon") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        IconCard(
            text: "1234.99 gr. de Puré de patata deshidratado (en polvo)",
            iconName: "potatoPowderIcon",
            onClick: {},
            withHightlightIcon: true
        )
    }
}
