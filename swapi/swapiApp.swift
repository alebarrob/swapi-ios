//
//  swapiApp.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 25/11/24.
//

import SwiftUI
import Factory

@main
struct swapiApp: App {
    var body: some Scene {
        WindowGroup {
            CategoryScreen(container: Container())
            .environment(\.dimensions, Dimensions())
            .environment(\.colors, Colors())
            .environment(\.typography, Typography())
        }
    }
}
