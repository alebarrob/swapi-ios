//
//  VerticalGradientBackground.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct VerticalGradientBackground<Content: View>: View {
    let colors: [Color]
    let content: Content
    
    init(colors: [Color], @ViewBuilder content: () -> Content) {
        self.colors = colors
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            content
        }
    }
}

#Preview("Vertical Gradient Background") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {}
}
