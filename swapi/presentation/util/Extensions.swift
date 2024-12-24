//
//  Extensions.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

import SwiftUI

extension View {
    func navigationBar(path: Binding<NavigationPath>) -> some View {
        self.modifier(NavigationBarModifier(path: path))
    }
}
