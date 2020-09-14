//
//  CalculatorViewController.swift
//  calculatorUITests
//
//  Created by David Garcia on 05/02/2019.
//  Copyright © 2019 David Garcia. All rights reserved.
//

import XCTest
@testable import Pods_calculator

class CalculatorViewControllerTests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        let button1 = app.buttons["1"]
        let button2 = app.buttons["2"]
        let buttonPlus = app.buttons["+"]
        let button6 = app.buttons["6"]
        let button5 = app.buttons["5"]
        let buttonMinus = app.buttons["-"]
        let button7 = app.buttons["7"]
        let buttonResult = app.buttons["="]
        
        button1.tap()
        button2.tap()
        buttonPlus.tap()
        button6.tap()
        button5.tap()
        buttonMinus.tap()
        button7.tap()
        buttonResult.tap()
        buttonPlus.tap()
        button1.tap()
        button6.tap()
        buttonMinus.tap()
        button2.tap()
        buttonResult.tap()
        
    }

}
