//
//  CalculatorViewModel.swift
//  calculatorTests
//
//  Created by David Garcia on 05/02/2019.
//  Copyright © 2019 David Garcia. All rights reserved.
//

import XCTest
@testable import Pods_calculator

class CalculatorViewModelTests: XCTestCase {
    let viewModel = CalculatorViewModel()
    
    override func setUp() {
        
    }

    override func tearDown() {
        super.tearDown()
    }

    func testApplyExpressionEmpty() {
        let text = ""
        let result = viewModel.applyExpression(text: text)
        XCTAssertEqual("", result)
    }
    
    func testApplyExpressionSimple() {
        let text = "1+3"
        let result = viewModel.applyExpression(text: text)
        XCTAssertEqual("4", result)
    }
    
    func testApplyExpressionLong() {
        let text = "-10+2+3-2"
        let result = viewModel.applyExpression(text: text)
        XCTAssertEqual("-7", result)
    }
    
    func testApplyExpressionSpecialCharacters() {
        let text = "10+2&"
        let result = viewModel.applyExpression(text: text)
        XCTAssertEqual(text, result)
    }
    
    func testApplyExpressionLetter() {
        let text = "10+a4"
        let result = viewModel.applyExpression(text: text)
        XCTAssertEqual(text, result)
    }
    
    func testApplyExpressionDecimal() {
        let text = "1.5-0.5"
        let result = viewModel.applyExpression(text: text)
        XCTAssertEqual("1", result)
    }
    
    func testApplyExpressionNegativeValues() {
        let text = "1.5-7"
        let result = viewModel.applyExpression(text: text)
        XCTAssertEqual("-5.5", result)
    }
    
    func testApplyExpressionPointZero() {
        let text = "0.3+0.2"
        let result = viewModel.applyExpression(text: text)
        XCTAssertEqual("0.5", result)
    }
    
}
