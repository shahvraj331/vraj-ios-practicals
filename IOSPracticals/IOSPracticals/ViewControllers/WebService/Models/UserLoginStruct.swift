//
//  UserLoginStruct.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 24/03/22.
//

import Foundation

struct UploadData: Codable {
    let email: String
    let password: String
}//End of struct

struct LoginSuccess: Codable {
    let token: String
}//End of struct
