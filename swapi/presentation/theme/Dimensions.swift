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
    
    let topBarIconSize: CGFloat = 32
    
    let actionButtonBorderLineWidth: CGFloat = 2
    let actionButtonHorizontalContentPadding: CGFloat = 52
    let actionButtonCornerRadius: CGFloat = 12
    
    let amountTextFieldWidth: CGFloat = 180
    let amountTextFieldBorderLineWidth: CGFloat = 1
    
    let errorPopupImageSize: CGFloat = 120
    let errorPopupYOffset: CGFloat = -70
    
    let highlightImageBorderLineWidth: CGFloat = 2
    let highlightImageSize: CGFloat = 40
    let highlightImageContainerSize: CGFloat = 45
    
    let informationCardVerticalPadding: CGFloat = 45
    let informationCardDecorativeImageSize: CGFloat = 120
    let informationCardDecorativeImageYOffset: CGFloat = -95
    let informationCardHightlightImageYOffset: CGFloat = -15
    let informationCardHightlightImageXOffset: CGFloat = -10
    
    let iconCardIconSize: CGFloat = 45
    let iconCardSize: CGFloat = 120
    let iconCardHightlightImageYOffset: CGFloat = -10
    let iconCardHightlightImageXOffset: CGFloat = -10
    
    let foodAmountCardContentSpacing: CGFloat = 1
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
