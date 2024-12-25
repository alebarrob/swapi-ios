//
//  GetEquivalentFoodsTest.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 25/12/24.
//

import XCTest
@testable import Swapi

class GetEquivalentFoodsTests: XCTestCase {
    
    var getEquivalentFoods: GetEquivalentFoods!
    
    override func setUp() {
        getEquivalentFoods = GetEquivalentFoods()
    }
    
    override func tearDown() {
        getEquivalentFoods = nil
    }
    
    func testGetEquivalentFoodsReturnsEquivalentFoods() {
        // Given
        let expected = [
            Food(
                id: 69,
                name: "Yogur desnatado",
                iconName: "yogurtIcon",
                standardAmount: 300.0,
                equivalentAmount: 25.0,
                category: Category(
                    id: 5,
                    name: "Lácteos",
                    conversionFactor: 100.0
                ),
                unit: Unit(
                    id: 1,
                    name: "gr."
                )
            ),
            Food(
                id: 70,
                name: "Yogur griego",
                iconName: "greekYogurtIcon",
                standardAmount: 100.0,
                equivalentAmount: 8.333333333333334,
                category: Category(
                    id: 5,
                    name: "Lácteos",
                    conversionFactor: 100.0
                ),
                unit: Unit(
                    id: 1,
                    name: "gr."
                )
            ),
            Food(
                id: 71,
                name: "Yogur proteico",
                iconName: "proteinYogurtIcon",
                standardAmount: 200.0,
                equivalentAmount: 16.666666666666668,
                category: Category(
                    id: 5,
                    name: "Lácteos",
                    conversionFactor: 100.0
                ),
                unit: Unit(
                    id: 1,
                    name: "gr."
                )
            )
        ]
        
        let discardedFood = Food(
            id: 68,
            name: "Leche desnatada",
            iconName: "milkIcon",
            standardAmount: 300.0,
            equivalentAmount: 0.0,
            category: Category(
                id: 5,
                name: "Lácteos",
                conversionFactor: 100.0
            ),
            unit: Unit(
                id: 2,
                name: "ml."
            )
        )
        
        let replacementFoods = [
            Food(
                id: 68,
                name: "Leche desnatada",
                iconName: "milkIcon",
                standardAmount: 300.0,
                equivalentAmount: 0.0,
                category: Category(
                    id: 5,
                    name: "Lácteos",
                    conversionFactor: 100.0
                ),
                unit: Unit(
                    id: 2,
                    name: "ml."
                )
            ),
            Food(
                id: 69,
                name: "Yogur desnatado",
                iconName: "yogurtIcon",
                standardAmount: 300.0,
                equivalentAmount: 0.0,
                category: Category(
                    id: 5,
                    name: "Lácteos",
                    conversionFactor: 100.0
                ),
                unit: Unit(
                    id: 1,
                    name: "gr."
                )
            ),
            Food(
                id: 70,
                name: "Yogur griego",
                iconName: "greekYogurtIcon",
                standardAmount: 100.0,
                equivalentAmount: 0.0,
                category: Category(
                    id: 5,
                    name: "Lácteos",
                    conversionFactor: 100.0
                ),
                unit: Unit(
                    id: 1,
                    name: "gr."
                )
            ),
            Food(
                id: 71,
                name: "Yogur proteico",
                iconName: "proteinYogurtIcon",
                standardAmount: 200.0,
                equivalentAmount: 0.0,
                category: Category(
                    id: 5,
                    name: "Lácteos",
                    conversionFactor: 100.0
                ),
                unit: Unit(
                    id: 1,
                    name: "gr."
                )
            )
        ]
        
        let params = GetEquivalentFoods.Params(
            discardedFood: discardedFood,
            discardedFoodAmount: 25.0,
            replacementFoods: replacementFoods
        )
        
        // When
        let actual = getEquivalentFoods.execute(params: params)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
