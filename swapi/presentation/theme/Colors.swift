//
//  Colors.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 17/12/24.
//

import SwiftUI

struct Colors {
    let black: Color = .black
    let white: Color = .white
    let grey: Color = Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255)
    let green: Color = Color(red: 96 / 255, green: 211 / 255, blue: 148 / 255)
    let red: Color = Color(red: 205 / 255, green: 56 / 255, blue: 88 / 255)
    let gold: Color = Color(red: 253 / 255, green: 222 / 255, blue: 79 / 255)

    let darkGreen: Color = Color(red: 42 / 255, green: 114 / 255, blue: 58 / 255)
    let lightGreen: Color = Color(red: 186 / 255, green: 255 / 255, blue: 151 / 255)
    let darkGold: Color = Color(red: 229 / 255, green: 189 / 255, blue: 2 / 255)
}

struct ColorsKey: EnvironmentKey {
    static let defaultValue = Colors()
}

extension EnvironmentValues {
    var colors: Colors {
        get { self[ColorsKey.self] }
        set { self[ColorsKey.self] = newValue }
    }
}
