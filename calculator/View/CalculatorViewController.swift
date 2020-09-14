//
//  CalculatorViewController.swift
//  calculator
//
//  Created by David Garcia on 04/02/2019.
//  Copyright © 2019 David Garcia. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    lazy var viewModel = CalculatorViewModel()
    var isNewOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapExpression(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        guard let result = resultLabel.text else { return }
        let operations = "+-"
        let characters = Array(result)
        if isNewOperation && !operations.contains(text) {
            if text == "." {
                resultLabel.text = "0."
            } else {
                resultLabel.text = text
            }
            isNewOperation = false
            return
        }
        isNewOperation = false
        if result.isEmpty && text == "." {
            resultLabel.text?.append("0.")
            return
        } else if text == "." && operations.contains(characters[characters.count - 1]) {
            resultLabel.text?.append("0.")
            return
        } else if (!result.isEmpty &&
            operations.contains(characters[characters.count - 1]) &&
            operations.contains(text)) || !validPoints(text: "\(result)\(text)") {
            return
        }
        resultLabel.text?.append(text)
    }
    
    @IBAction func tapAction(_ sender: UIButton) {
        guard let action = sender.titleLabel?.text else { return }
        switch action {
        case "=":
            guard let result = resultLabel.text else { return }
            resultLabel.text = viewModel.applyExpression(text: result)
        default:
            resultLabel.text = ""
        }
        isNewOperation = true
    }
    
    func validPoints(text: String) -> Bool {
        var count = 0
        for character in text {
            if "+-".contains(character) {
                count = 0
            } else if character == "." {
                count += 1
                if count == 2 {
                    return false
                }
            }
        }
        return true
    }
    
}
