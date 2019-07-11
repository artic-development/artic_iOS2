//
//  MyPageService.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 08/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation
import Alamofire

struct MyPageService {
    
    static let shared = MyPageService()
    
    // App Auth API
    func getMyPage(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.MyPageURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "token": UserDefaults.standard.string(forKey: "token")!
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            
                            switch status {
                            case 200:
                                do {
                                    print("do")
                                    print(value)
                                    
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseObject<MyPageData>.self, from: value)
                                    
                                    print("try")
                                    //print(result)
                                    
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
}
