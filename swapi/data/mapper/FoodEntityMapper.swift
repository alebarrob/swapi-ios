//
//  FoodEntityMapper.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

private let INITIAL_EQUIVALENT_AMOUNT = 0.0
private let PLACEHOLDER_ICON_NAME = "placeholder"

extension FoodEntity {
    func toFood() -> Food {
        guard let category = category else {
            fatalError("Category es nil en FoodEntity con id \(id)")
        }
                
        guard let unit = unit else {
            fatalError("Unit es nil en FoodEntity con id \(id)")
        }
        
        return Food(
            id: Int(id),
            name: name ?? UNAVAILABLE_NAME,
            iconName: iconName ?? PLACEHOLDER_ICON_NAME,
            standardAmount: standardAmount,
            equivalentAmount: INITIAL_EQUIVALENT_AMOUNT,
            category: category.toCategory(),
            unit: unit.toUnit()
        )
    }
}
