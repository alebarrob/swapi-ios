//
//  swapiApp.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 25/11/24.
//

import SwiftUI
import Factory

@main
struct SwapiApp: App {
    var body: some Scene {
        WindowGroup {
            NavGraph(container: Container())
            .environment(\.dimensions, Dimensions())
            .environment(\.colors, Colors())
            .environment(\.typography, Typography())
        }
    }
}
