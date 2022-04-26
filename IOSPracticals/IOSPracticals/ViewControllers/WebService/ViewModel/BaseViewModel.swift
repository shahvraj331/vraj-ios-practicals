//
//  BaseViewModel.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 14/04/22.
//

import Foundation

class BaseViewModel {
    
    //MARK: - Variables
    var onAddUserFetchSuccess: newUserResponseCallBack?
    var onGetSingleUserSuccess: singleUserResponseCallBack?
    
    //MARK: - static functions
    func addSingleUser(name: String, job: String) {
        let newUser = NewUser(name: name, job: job)
        let newUserData = newUser.newUserDict
        APICall.request(url: ApiUrl.addUserURL.rawValue, method: .post, parameters: newUserData, requiredStatusCode: 201, headers: nil, decodingType: NewUserResponse.self) { data in
            guard let data = data else {
                self.onAddUserFetchSuccess?(nil)
                return
            }
            self.onAddUserFetchSuccess?(data)
        }
    }
    
    func getSingleUser(selectedUserIndex: Int) {
        APICall.request(url: ApiUrl.singleUserURL.rawValue + String(selectedUserIndex), method: .get, requiredStatusCode: 200, decodingType: SingleUserResponse.self) { data in
            guard let data = data else {
                self.onGetSingleUserSuccess?(nil)
                return
            }
            self.onGetSingleUserSuccess?(data)
        }
    }
    
}//End of class
