//
//  Validator.swift
//  Football
//
//  Created by Alexander Filimonov on 28/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

class Validator {

    static func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

}
