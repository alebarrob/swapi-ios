//
//  IsValidFoodAmountTest.swift
//  swapiTests
//
//  Created by Alejandro Barrera Robles on 25/11/24.
//

import XCTest
@testable import Swapi

final class IsValidFoodAmountTest: XCTestCase {
    
    private var isValidFoodAmount: IsValidFoodAmount!

    override func setUpWithError() throws {
        isValidFoodAmount = IsValidFoodAmount()
    }

    override func tearDownWithError() throws {
        isValidFoodAmount = nil
    }

    func testIsValidFoodAmountReturnsTrueOnIntegerNumberInput() throws {
        // Given
        let amount = "42"
        let expected = true
        
        // When
        let actual = isValidFoodAmount.execute(params: IsValidFoodAmount.Params(amount: amount))

        // Then
        XCTAssertEqual(expected, actual)
    }

    func testIsValidFoodAmountReturnsTrueOnDecimalNumberInput() throws {
        // Given
        let amount = "42.42"
        let expected = true
        
        // When
        let actual = isValidFoodAmount.execute(params: IsValidFoodAmount.Params(amount: amount))

        // Then
        XCTAssertEqual(expected, actual)
    }

    func testIsValidFoodAmountReturnsFalseOnNonNumberInput() throws {
        // Given
        let amount = "The meaning of life"
        let expected = false
        
        // When
        let actual = isValidFoodAmount.execute(params: IsValidFoodAmount.Params(amount: amount))

        // Then
        XCTAssertEqual(expected, actual)
    }

    func testIsValidFoodAmountReturnsFalseOnNumberWithMultipleDecimalPointsInput() throws {
        // Given
        let amount = "42.42.42"
        let expected = false
        
        // When
        let actual = isValidFoodAmount.execute(params: IsValidFoodAmount.Params(amount: amount))

        // Then
        XCTAssertEqual(expected, actual)
    }
}

