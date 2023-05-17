//
//  SignUpViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/17.
//

import Alamofire
import Foundation
import KeychainSwift

class SignUpViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func postUserInfo(agreeMarketing: Bool, email: String, nickname: String) {
        let url = "\(baseUrl)/api/signup"
        let parameters: [String: Any] = ["agreeMarketing": agreeMarketing,
                                         "email": email,
                                         "nickname": nickname]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PostSignUpResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
