//
//  MyPageViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/21.
//

import Alamofire
import Foundation
import KeychainSwift

class MyPageViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func putNickname(nickname: String) {
        let url = "\(baseUrl)/api/user"
        let parameters: [String: Any] = [
            "nickName": nickname
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url,
                   method: .put,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PutNicknameResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
