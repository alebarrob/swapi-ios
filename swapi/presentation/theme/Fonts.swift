//
//  Fonts.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 17/12/24.
//

import SwiftUI

extension Font {
    static func inriaSans(_ weight: Font.Weight, size: CGFloat) -> Font {
        switch weight {
        case .regular:
            return .custom("InriaSans-Regular", size: size)
        case .bold:
            return .custom("InriaSans-Bold", size: size)
        default:
            return .custom("InriaSans-Regular", size: size)
        }
    }
    
    static func lato(_ weight: Font.Weight, size: CGFloat) -> Font {
        switch weight {
        case .regular:
            return .custom("Lato-Regular", size: size)
        case .bold:
            return .custom("Lato-Bold", size: size)
        default:
            return .custom("Lato-Regular", size: size)
        }
    }
}

struct Typography {
    struct Titles {
        let medium: Font
    }
    
    struct Body {
        let medium: Font
    }
    
    struct Labels {
        let large: Font
        let medium: Font
        let small: Font
    }
    
    let titles = Titles(
        medium: .inriaSans(.regular, size: 16)
    )
    
    let body = Body(
        medium: .inriaSans(.regular, size: 16)
    )
    
    let labels = Labels(
        large: .lato(.bold, size: 27),
        medium: .lato(.regular, size: 16),
        small: .lato(.regular, size: 13)
    )
}

struct TypographyKey: EnvironmentKey {
    static let defaultValue = Typography()
}

extension EnvironmentValues {
    var typography: Typography {
        get { self[TypographyKey.self] }
        set { self[TypographyKey.self] = newValue }
    }
}
