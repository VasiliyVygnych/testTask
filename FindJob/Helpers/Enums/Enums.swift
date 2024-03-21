//
//  Enums.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import Foundation


enum Sections {
    case main
    case top
}
//MARK: Controllers
enum Controllers {
    case auth
    case search
    case favorites
    case responses
    case messages
    case profile
    case none
}

enum ViewStates {
    case loading
    case success
    case failed
    case none
}

enum Regex: String {
    case predicateFormat = "SELF MATCHES %@"
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,64}"
    case phone = "(\\s*)?(\\+)?([- _():=+]?\\d[- _():=+]?){11,14}(\\s*)?"
    case confirmationCode = "(\\+)?(\\+)?(\\+)?(\\+)?"
}

