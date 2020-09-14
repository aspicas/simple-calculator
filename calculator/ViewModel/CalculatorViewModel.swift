//
//  CalculatorViewModel.swift
//  calculator
//
//  Created by David Garcia on 04/02/2019.
//  Copyright © 2019 David Garcia. All rights reserved.
//

import Foundation

class CalculatorViewModel {
    let validationHelper = ValidationHelper()
    let mathExpression = MathExpression()
    
    init() {
        
    }
    
    func applyExpression(text: String) -> String {
        if validationHelper.validate(mathExpression: text) {
            let result = mathExpression.doMath(expression: text)
            return result != "" ? result : text
        }
        return text
    }

}
