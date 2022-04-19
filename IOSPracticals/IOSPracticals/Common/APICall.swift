//
//  AlamofireRequest.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 29/03/22.
//
import Alamofire

class APICall {
    
    //MARK: - static functions
    static func request<T: Decodable>(url: String, method: HTTPMethod, parameters: Parameters? = nil, requiredStatusCode: Int, headers: HTTPHeaders? = nil, decodingType: T.Type, completionHandler completion: @escaping (T?) -> Void) {
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
                        catch {
                            completion(nil)
                        }
                    }
                    break
                case .failure:
                    completion(nil)
                    break
                }
            }
        }
    }
    
}//End of class
