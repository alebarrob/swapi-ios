//
//  LoadingScreen.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        ProgressView("¡Espera un momento!")
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
    }
}

#Preview("Loading State") {
    LoadingScreen()
}
