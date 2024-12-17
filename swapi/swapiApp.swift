//
//  swapiApp.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 25/11/24.
//

import SwiftUI

@main
struct swapiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.dimensions, Dimensions())
                .environment(\.colors, Colors())
                .environment(\.typography, Typography())
        }
    }
}
