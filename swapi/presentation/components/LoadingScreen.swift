//
//  LoadingScreen.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct LoadingScreen: View {
    @Environment(\.colors) var colors
    
    var body: some View {
        ZStack {
            ProgressView("¡Espera un momento!")
            .foregroundColor(colors.black)
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
        }
    }
}

#Preview("Loading State") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        LoadingScreen()
    }
}
