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
        let url = "\(baseUrl)/auth/signup"
        let parameters: [String: Any] = ["agreeMarketing": agreeMarketing,
                                         "email": email,
                                         "nickName": nickname]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseData { response in
                switch response.result {
                case .success:
                    let decoder = JSONDecoder()
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let data = response.value else { return }
                    switch statusCode {
                    case 200:
                        guard let signUpRes = try? decoder.decode(PostSignUpResponse.self, from: data) else { return }
                        print(signUpRes.message)
                        print("DEBUG postUserInfo: success")
                    default:
                        print("DEBUG postUserInfo: not 200")
                    }
                case .failure(let error):
                    print("DEBUG postUserInfo: \(error)")
                }
            }
    }
    
    func postSelectedValues(selectedValues: [String]) {
        let url = "\(baseUrl)/api/value"
        let parameters: [String: Any] = ["values": selectedValues]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PostSelectedValuesResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("DEBUG postSelectedValues: \(response.message)")
                case .failure(let error):
                    print("DEBUG postSelectedValues: \(error)")
                }
            }
    }
}
