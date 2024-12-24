//
//  FoodMapper.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

import Foundation

extension Food {
    func toFoodVo() -> FoodVo {
        let formattedEquivalentAmount = equivalentAmount.formatAndRemoveTrailingZeros()
        
        return FoodVo(
            id: id,
            name: name,
            iconName: iconName,
            standardAmount: String(standardAmount),
            equivalentAmount: formattedEquivalentAmount,
            category: category.toCategoryVo(),
            unit: unit.toUnitVo()
        )
    }
}
