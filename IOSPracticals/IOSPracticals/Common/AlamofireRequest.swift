//
//  AlamofireRequest.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 29/03/22.
//
import Foundation
import Alamofire

class AlamofireRequest {
    
    //MARK: - static functions
    static func addSingleUser(controller: UIViewController, name: String, job: String, completion: @escaping (NewUserResponse?) -> Void) {
        let newUser = NewUser(name: name, job: job)
        let newUserData = newUser.newUserDict
        AlamofireRequest.request(controller: controller, url: ApiUrl.singleUserURL.rawValue, method: .post, parameters: newUserData, requiredStatusCode: 201, headers: nil, decodingType: NewUserResponse.self, completionHandler: completion)
    }
    
    static func getSingleUser(controller: UIViewController, selectedUserIndex: Int, completion: @escaping (SingleUserResponse?) -> Void) {
        AlamofireRequest.request(controller: controller, url: ApiUrl.singleUserURL.rawValue + String(selectedUserIndex), method: .get, requiredStatusCode: 200, decodingType: SingleUserResponse.self, completionHandler: completion)
    }
    
    //MARK: - fileprivate, static functions
    fileprivate static func request<T: Decodable>(controller: UIViewController, url: String, method: HTTPMethod, parameters: Parameters? = nil, requiredStatusCode: Int, headers: HTTPHeaders? = nil, decodingType: T.Type, completionHandler completion: @escaping (T?) -> Void) {
        
        AF.request(url, method: method, parameters: parameters, encoding: parameters == nil ? URLEncoding.default : JSONEncoding.default, headers: headers).response { response in
            guard let statusCode = response.response?.statusCode else { return }
            if (requiredStatusCode == statusCode) {
                switch response.result {
                case .success(let data):
                    if let responseData = data {
                        do {
                            let dataFromServer = try JSONDecoder().decode(T.self, from: responseData)
                            completion(dataFromServer)
                        }
                        catch let error {
                            Validation.showToast(controller: controller, message: error.localizedDescription, seconds: 1.5)
                        }
                    }
                    break
                case .failure(let error):
                    Validation.showToast(controller: controller, message: error.localizedDescription, seconds: 1.5)
                    break
                }
            }
        }
    }
    
}//End of class
