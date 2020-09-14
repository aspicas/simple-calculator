//
//  MathExpressionTests.swift
//  calculatorTests
//
//  Created by David Garcia on 05/02/2019.
//  Copyright © 2019 David Garcia. All rights reserved.
//

import XCTest
@testable import Pods_calculator

class MathExpressionTests: XCTestCase {
    let mathExpression = MathExpression()
    
    override func setUp() {
        
    }

    override func tearDown() {
        
        super.tearDown()
    }

    func testDoMathEmpty() {
        let text = ""
        let result = mathExpression.doMath(expression: text)
        XCTAssertEqual("", result)
    }

    func testDoMathLetter() {
        let text = "a"
        let result = mathExpression.doMath(expression: text)
        XCTAssertEqual("", result)
    }
    
    func testDoMathNumber() {
        let text = "1"
        let result = mathExpression.doMath(expression: text)
        XCTAssertEqual("1", result)
    }
    
    func testDoMathNegativeNumber() {
        let text = "-1"
        let result = mathExpression.doMath(expression: text)
        XCTAssertEqual("-1", result)
    }
    
    func testDoMathSimpleAddition() {
        let text = "1+3"
        let result = mathExpression.doMath(expression: text)
        XCTAssertEqual("4", result)
    }
    
    func testDoMathSimpleAddition2() {
        let text = "-1-3"
        let result = mathExpression.doMath(expression: text)
        XCTAssertEqual("-4", result)
    }
    
    func testDoMathSimpleSubtraction() {
        let text = "1-3"
        let result = mathExpression.doMath(expression: text)
        XCTAssertEqual("-2", result)
    }
    
    func testDoMathComplexExpression() {
        let text = "12+65-7+16-2"
        let result = mathExpression.doMath(expression: text)
        XCTAssertEqual("84", result)
    }
}
