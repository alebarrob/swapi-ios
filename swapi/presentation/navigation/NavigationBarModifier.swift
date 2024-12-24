//
//  NavigationBarModifier.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    @Environment(\.colors) var colors
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    
    @Binding var path: NavigationPath

    func body(content: Content) -> some View {
        content
            .toolbarBackground(colors.darkGreen, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { path.removeLast() }) {
                        HStack(spacing: dimensions.small) {
                            Image(systemName: "chevron.backward")
                            Text("Volver")
                        }
                        .foregroundColor(colors.white)
                        .font(typography.labels.medium)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { path = NavigationPath() }) {
                        Image(systemName: "house")
                            .foregroundColor(colors.white)
                    }
                }
            }
    }
}
