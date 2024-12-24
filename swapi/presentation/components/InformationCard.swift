//
//  InformationCard.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct InformationCard: View {
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    @Environment(\.colors) var colors
    
    let text: () -> Text
    let decorativeIconName: String?
    let highlightIconName: String?
    let iconPosition: IconPosition
    
    var body: some View {
        ZStack {
            text()
            .font(typography.body.medium)
            .foregroundColor(colors.black)
            .multilineTextAlignment(.center)
        }
        .padding(.horizontal, dimensions.large)
        .padding(.vertical, dimensions.informationCardVerticalPadding)
        .background(colors.white)
        .cornerRadius(dimensions.medium)
        .overlay(alignment: iconPosition == .decorativeOnStart ? .topLeading : .topTrailing) {
            Group {
                if let iconName = decorativeIconName {
                    Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: dimensions.informationCardDecorativeImageSize,
                        height: dimensions.informationCardDecorativeImageSize
                    )
                    .padding(dimensions.small)
                    .offset(y: dimensions.informationCardDecorativeImageYOffset)
                } else {
                    EmptyView()
                }
            }
        }
        .overlay(alignment: iconPosition == .highlightOnStart ? .topLeading : .topTrailing) {
            Group {
                if let iconName = highlightIconName {
                    HighlightIcon(iconName: iconName)
                    .offset(
                        x: dimensions.informationCardHightlightImageXOffset,
                        y: dimensions.informationCardHightlightImageYOffset
                    )
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview("Information Card Decorative Icon on start") {
    @Previewable @Environment(\.dimensions) var dimensions
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        ZStack {
            InformationCard(
                text: {
                    Text("¡Bienvenid@ a ")
                    .foregroundColor(colors.black)
                    + Text("Swapi")
                    .foregroundColor(colors.red)
                    .bold()
                    + Text("! Para empezar, elige la ")
                    .foregroundColor(colors.black)
                    + Text("categoría")
                    .foregroundColor(colors.darkGreen)
                    .bold()
                    + Text(" del alimento que te gustaría cambiar en tu dieta.")
                    .foregroundColor(colors.black)
                },
                decorativeIconName: "surprisedWatermelonIcon",
                highlightIconName: nil,
                iconPosition: IconPosition.decorativeOnStart
            )
        }
        .padding(.horizontal, -dimensions.informationCardHightlightImageXOffset)
        .padding(.top, -dimensions.informationCardDecorativeImageYOffset)
    }
}

#Preview("Information Card Decorative Icon on end") {
    @Previewable @Environment(\.dimensions) var dimensions
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        ZStack {
            InformationCard(
                text: {
                    Text("¡Bienvenid@ a ")
                    .foregroundColor(colors.black)
                    + Text("Swapi")
                    .foregroundColor(colors.red)
                    .bold()
                    + Text("! Para empezar, elige la ")
                    .foregroundColor(colors.black)
                    + Text("categoría")
                    .foregroundColor(colors.darkGreen)
                    .bold()
                    + Text(" del alimento que te gustaría cambiar en tu dieta.")
                    .foregroundColor(colors.black)
                },
                decorativeIconName: "wowWatermelonIcon",
                highlightIconName: nil,
                iconPosition: IconPosition.highlightOnStart
            )
        }
        .padding(.horizontal, -dimensions.informationCardHightlightImageXOffset)
        .padding(.top, -dimensions.informationCardDecorativeImageYOffset)
    }
}

#Preview("Information Card Highlight Icon on start and Decorative Icon on end") {
    @Previewable @Environment(\.dimensions) var dimensions
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        ZStack {
            InformationCard(
                text: {
                    Text("¡Bienvenid@ a ")
                    .foregroundColor(colors.black)
                    + Text("Swapi")
                    .foregroundColor(colors.red)
                    .bold()
                    + Text("! Para empezar, elige la ")
                    .foregroundColor(colors.black)
                    + Text("categoría")
                    .foregroundColor(colors.darkGreen)
                    .bold()
                    + Text(" del alimento que te gustaría cambiar en tu dieta.")
                    .foregroundColor(colors.black)
                },
                decorativeIconName: "wowWatermelonIcon",
                highlightIconName: "avocadoIcon",
                iconPosition: IconPosition.highlightOnStart
            )
        }
        .padding(.horizontal, -dimensions.informationCardHightlightImageXOffset)
        .padding(.top, -dimensions.informationCardDecorativeImageYOffset)
    }
}
