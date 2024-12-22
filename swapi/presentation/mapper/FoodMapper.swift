//
//  FoodMapper.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

import Foundation

extension Food {
    func toFoodVo() -> FoodVo {
        let formattedEquivalentAmount = formatEquivalentAmount(equivalentAmount: equivalentAmount)
        
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
    
    private func formatEquivalentAmount(equivalentAmount: Double) -> String {
        let twoDecimalsFormattedAmount = String(format: "%.2f", equivalentAmount)
        let trailingZerosRegex = try! NSRegularExpression(pattern: "[.,]00$")
        let formattedEquivalentAmount = trailingZerosRegex.stringByReplacingMatches(
            in: twoDecimalsFormattedAmount,
            options: [],
            range: NSRange(location: 0, length: twoDecimalsFormattedAmount.count),
            withTemplate: ""
        )
        
        return formattedEquivalentAmount
    }
}
