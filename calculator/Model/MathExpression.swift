//
//  MathExpression.swift
//  calculator
//
//  Created by David Garcia on 04/02/2019.
//  Copyright © 2019 David Garcia. All rights reserved.
//

import Foundation

class MathExpression: NSObject {
    func doMath(expression: String) -> String {
        if expression != "" {
            let mathExpression = NSExpression(format: expression)
            guard let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Double else { return "" }
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 9
            formatter.minimumSignificantDigits = 1
            guard let value = formatter.string(from: NSNumber(value: mathValue)) else { return "" }
            return value
        } else {
            return expression
        }
    }
}
