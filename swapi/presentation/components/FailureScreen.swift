//
//  FailureScreen.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct FailureScreen: View {
    @Environment(\.dimensions) var dimensions
    
    var body: some View {
        ZStack {
            ErrorPopup()
        }
    }
}

struct ErrorPopup: View {
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    @Environment(\.colors) var colors
    
    var body: some View {
        VStack(spacing: dimensions.medium) {
            Text("¡Vaya!")
            .font(typography.labels.large)
            .foregroundColor(colors.white)
            .multilineTextAlignment(.center)

            Text("Ocurrió un error inesperado. Reinicia la aplicación e inténtalo de nuevo.")
            .font(typography.body.medium)
            .foregroundColor(colors.white)
            .multilineTextAlignment(.center)
        }
        .padding(dimensions.large)
        .background(colors.black)
        .cornerRadius(dimensions.medium)
        .shadow(radius: dimensions.medium)
        .overlay(alignment: .topTrailing) {
            Image("knifeWatermelonIcon")
            .resizable()
            .scaledToFit()
            .frame(
                width: dimensions.errorPopupImageSize,
                height: dimensions.errorPopupImageSize
            )
            .offset(y: dimensions.errorPopupYOffset)
        }
    }
}

#Preview("Failure Screen") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        FailureScreen()
    }
}
