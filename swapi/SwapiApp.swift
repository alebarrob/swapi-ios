//
//  swapiApp.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 25/11/24.
//

import SwiftUI
import Factory
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SwapiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavGraph(container: Container())
            .environment(\.dimensions, Dimensions())
            .environment(\.colors, Colors())
            .environment(\.typography, Typography())
        }
    }
}
