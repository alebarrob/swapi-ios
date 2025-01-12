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
    
    @State private var showDietistSheet = false
    @State private var showInfoSheet = false

    func body(content: Content) -> some View {
        content
            .toolbarBackground(colors.darkGreen, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(
                            action: {
                                showDietistSheet = true
                            }
                        ) {
                            Image("dietistIcon")
                                .resizable()
                                .scaledToFit()
                        }
                        Button(
                            action: {
                                showInfoSheet = true
                            }
                        ) {
                            Image("infoIcon")
                                .resizable()
                                .scaledToFit()
                        }
                        Button(
                            action: {
                                path = NavigationPath()
                            }
                        ) {
                            Image("restartIcon")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .sheet(isPresented: $showDietistSheet) {
                DietistContactSheet()
            }
            .sheet(isPresented: $showInfoSheet) {
                InfoSheet()
            }
    }
}
