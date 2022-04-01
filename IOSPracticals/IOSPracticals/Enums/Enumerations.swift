//
//  SignUpValidation.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 28/02/22.
//

import Foundation

enum SignUpValidation: Error {
    case fullNameEmpty
    case emailEmpty
    case passwordEmpty
    case emailNotValid
    case passwordTooShort
    var getErrorDetail: String {
        switch self {
        case .fullNameEmpty:
            return "FullName is empty"
        case .emailEmpty:
            return "Email is empty"
        case .passwordEmpty:
            return "Password is empty"
        case .emailNotValid:
            return "Email is not valid"
        case .passwordTooShort:
            return "Password length too short"
        }
    }
}

enum ApiUrl: String {
    case loginRequestURL = "https://reqres.in/api/login"
    case delayResponseURL = "https://reqres.in/api/users?delay=3"
    case singleUserURL = "https://reqres.in/api/users/"
    case addUserURL = "https://reqres.in/api/users"
}
