//
//  Dimensions.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 17/12/24.
//

import SwiftUI

struct Dimensions {
    let `default`: CGFloat = 0
    let extraSmall: CGFloat = 4
    let small: CGFloat = 8
    let medium: CGFloat = 16
    let large: CGFloat = 32
    let extraLarge: CGFloat = 64
    let giant: CGFloat = 128
}

struct DimensionsKey: EnvironmentKey {
    static let defaultValue = Dimensions()
}

extension EnvironmentValues {
    var dimensions: Dimensions {
        get { self[DimensionsKey.self] }
        set { self[DimensionsKey.self] = newValue }
    }
}
