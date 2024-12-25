//
//  navigationTest.swift
//  swapiUITests
//
//  Created by Alejandro Barrera Robles on 25/11/24.
//

import XCTest

final class NavigationTests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launchArguments = ["UI-Testing"]
        app.launch()
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testNavigateToFoodResultScreen() {
        app.buttons["CATEGORÍAS"].tap()
        app.buttons["FRUTAS"].tap()
        app.staticTexts["Arándanos"].tap()
        app.textFields["gr."].tap()
        app.textFields["gr."].typeText("25")
        app.buttons["¡Calcular Equivalencias!"].tap()
        
        XCTAssertTrue(app.staticTexts["30.21 gr. de Cerezas"].exists)
    }

    func testNavigateBack() {
        app.buttons["CATEGORÍAS"].tap()
        app.buttons["FRUTAS"].tap()
        app.otherElements["Volver"].tap()
        
        XCTAssertTrue(app.buttons["CATEGORÍAS"].exists)
    }

    func testResetNavigation() {
        app.buttons["CATEGORÍAS"].tap()
        app.buttons["FRUTAS"].tap()
        app.staticTexts["Arándanos"].tap()
        app.textFields["gr."].tap()
        app.textFields["gr."].typeText("25")
        app.buttons["¡Calcular Equivalencias!"].tap()
        app.otherElements["Home"].tap()
    
        XCTAssertTrue(app.buttons["CATEGORÍAS"].exists)
    }
}
