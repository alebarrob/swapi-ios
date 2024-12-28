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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { path = NavigationPath() }) {
                        Image(systemName: "house")
                            .foregroundColor(colors.white)
                    }
                }
            }
    }
}
