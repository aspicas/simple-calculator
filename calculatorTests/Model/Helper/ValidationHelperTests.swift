//
//  ValidationHelperTests.swift
//  calculatorTests
//
//  Created by David Garcia on 05/02/2019.
//  Copyright © 2019 David Garcia. All rights reserved.
//

import XCTest
@testable import Pods_calculator

class ValidationHelperTests: XCTestCase {
    let validationHelper = ValidationHelper()
    
    override func setUp() {
    }

    override func tearDown() {
        super.tearDown()
    }

    func testValidateEmpty() {
        let text = ""
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertFalse(result)
    }
    
    func testValidateNumber() {
        let text = "1"
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertTrue(result)
    }
    
    func testValidateSign() {
        let text = "-1"
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertTrue(result)
    }
    
    func testValidateSimpleMathExpression() {
        let text = "12+23"
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertTrue(result)
    }
    
    func testValidateComplicateMathExpression() {
        let text = "12+23-800"
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertTrue(result)
    }
    
    func testValidateWrongMathExpression() {
        let text = "--22+55"
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertFalse(result)
    }
    
    func testValidateWrongMathExpression2() {
        let text = "22+55--"
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertFalse(result)
    }
    
    func testValidateWrongMathExpression3() {
        let text = "22++55"
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertFalse(result)
    }
    
    func testValidateWrongSignExpression() {
        let text = "-+"
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertFalse(result)
    }
    
    func testValidateLetter() {
        let text = "abc"
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertFalse(result)
    }
    
    func testValidateSpecialCharacters() {
        let text = "+25-3&"
        let result = validationHelper.validate(mathExpression: text)
        XCTAssertFalse(result)
    }

}
