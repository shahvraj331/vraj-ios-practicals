//
//  UsersData.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 24/03/22.
//

import Foundation

struct UsersList: Codable {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [UserData]
    let support: Support
    
    private enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
        case support
    }
}//End of struct

struct UserData: Codable {
    let userID: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    private enum CodingKeys: String, CodingKey {
        case userID = "id"
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}//End of struct

struct Support: Codable {
    let url: String
    let text: String
}//End of struct

struct SingleUserResponse: Codable {
    let data: UserData
    let support: Support
}//End of struct

struct NewUser: Codable {
    let name: String
    let job: String
    
    var newUserDict: [String: String] {
        return [
            "name": name,
            "job": job
        ]
    }
}//End of struct

struct NewUserResponse: Codable {
    let name: String
    let job: String
    let id: String
    let createdAt: String
}//End of struct
