
//
//  AuthService.swift
//  Artic
//
//  Created by admin on 08/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation
import Alamofire

struct AuthService {
    
    static let shared = AuthService()
    let header: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    // App Auth API
    func login(_ id: String, _ pw: String,completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = "http://15.164.11.203:3000/auth/signin"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "id" : id,
            "pw" : pw
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            
                            switch status {
                            case 200:
                                do {
                                    //print("do")
                                    //print(value)
                                    
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseObject<Signin>.self, from: value)
                                    
                                    //print("try")
                                    //print(result.data!.token)
                                    
                                    switch result.success {
                                    case true:
                                        completion(.success(result.data))
                                    case false:
                                        completion(.requestErr(result.message))
                                    }
                                } catch {
                                    print(".pathErr catch")
                                    completion(.pathErr)
                                }
                            case 400:
                                print(".pathErr 400")
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                                
                            default:
                                break
                            }
                        }
                    }
                    break
                    
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    break
                }
        }
    }
        
    func signUp(_ id: String, _ pw: String, _ birth: String, _ name: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = "http://15.164.11.203:3000/auth/signup"
        
        let body: Parameters = [
            "id" : id,
            "pw" : pw,
            "birth" : birth,
            "name" : name
        ]
        
        print("\(body)sss")
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            
                            switch status {
                            case 200, 201:
                                do {
                                    //print("do")
                                    //print(value)
                                    
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseObject<Signup>.self, from: value)
                                    //print("send result.data22")
                                    
                                    //print("try")
                                    //print(result)
                                    
                                    switch result.success {
                                    case true:
                                        //print("send result.data")
                                        completion(.success(result.data))
                                    case false:
                                        completion(.requestErr(result.message))
                                    }
                                } catch {
                                    print(".pathErr catch")
                                    completion(.pathErr)
                                }
                            case 400:
                                print(".pathErr 400")
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                                
                            default:
                                break
                            }
                        }
                    }
                    break
                    
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    break
                }
        }
}
}
