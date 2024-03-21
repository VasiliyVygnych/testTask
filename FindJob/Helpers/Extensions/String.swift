//
//  Extensions.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit

//MARK: String
extension String {
    func addingMask(value: String,
                    mask: String) -> String {
        let cleanValue = value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanValue.startIndex
        for ch in mask where index < cleanValue.endIndex {
        if ch == "*" {
            result.append(cleanValue[index])
            index = cleanValue.index(after: index)
        } else {
            result.append(ch)
            }
        }
        return result
    }
    func formatterNumber() -> String {
        let cleanPhoneNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mark = "XXXXXXXXXXX"
        var result = ""
        var startIndex = cleanPhoneNumber.startIndex
        let endIndex = cleanPhoneNumber.endIndex
        for charct in mark where startIndex < endIndex {
            if charct == "X" {
                result.append(cleanPhoneNumber[startIndex])
                startIndex = cleanPhoneNumber.index(after: startIndex)
            } else {
                result.append(charct)
            }
        }
        return result
    }
    
    
    func chekEmail() -> Bool {
        let emailPredicate = NSPredicate(format: Regex.predicateFormat.rawValue,
                                Regex.email.rawValue)
        return emailPredicate.evaluate(with: self)
    }
    func chekPhoneNumber() -> Bool {
        let numberPredicate = NSPredicate(format: Regex.predicateFormat.rawValue,
                                Regex.phone.rawValue)
        return numberPredicate.evaluate(with: self)
    }
    func chekConfirmationCode() -> Bool {
        let numberPredicate = NSPredicate(format: Regex.predicateFormat.rawValue,
                                Regex.confirmationCode.rawValue)
        return numberPredicate.evaluate(with: self)
    }
    struct Validation {
        static let emailPredicate = NSPredicate(format: "SELF MATCHES %@", 
                                                Regex.email.rawValue)
        static let numberPredicate = NSPredicate(format: "SELF MATCHES %@",
                                                 Regex.phone.rawValue)
        static let codePredicate = NSPredicate(format: "SELF MATCHES %@",
                                                 Regex.confirmationCode.rawValue)
    }
    func isEmail() -> Bool {
        return Validation.emailPredicate.evaluate(with: self)
    }
    func isPhoneNumber() -> Bool {
        return Validation.numberPredicate.evaluate(with: self)
    }
    func isConfirmationCode() -> Bool {
        return Validation.codePredicate.evaluate(with: self)
    }
}
