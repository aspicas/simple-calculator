//
//  ValidationHelper.swift
//  calculator
//
//  Created by David Garcia on 04/02/2019.
//  Copyright © 2019 David Garcia. All rights reserved.
//

import Foundation
import Validator

enum MathExpressionValidator: ValidationPattern {
    case simple
    
    public var pattern: String {
        switch self {
        case .simple: return "^[+\\-]?([0-9]+)([+\\-*\\/\\.][0-9]+)*$"
        }
    }
}

enum ValidateMathExpression: Error {
    case invalidMathExpression
}

public class ValidationHelper: NSObject {
    func validate(mathExpression: String) -> Bool {
        let rule = ValidationRulePattern(pattern: MathExpressionValidator.simple,
                                         error: ValidateMathExpression.invalidMathExpression)
        let result = mathExpression.validate(rule: rule)
        switch result {
        case .valid:
            return true
        default:
            return false
        }
    }
}
