//
//  AuthViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/09.
//

import Alamofire
import Foundation
import KeychainSwift

struct PostRegenerateTokenRequest: Codable {
    let refreshToken: String
}

struct PostRegenerateTokenResponse: Codable {
    let accessToken: String
    let refreshToken: String
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool?
    
    init(isLoggedIn: Bool) {
        self.isLoggedIn = false
    }
    
    let keychain = KeychainSwift()
    
    func regenerateToken(req: PostRegenerateTokenRequest) {
        let url = "http://ec2-3-36-172-10.ap-northeast-2.compute.amazonaws.com/auth/regenerate-token"
        let parameters: [String: Any] = [
            "refresh_token": req.refreshToken
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PostRegenerateTokenResponse.self) { response in
                switch response.result {
                case .success(let response):
                    self.isLoggedIn = true
                    self.keychain.set(response.accessToken,
                                      forKey: "accessToken")
                    self.keychain.set(response.refreshToken,
                                      forKey: "refreshToken")
                    print("accessToken \(response.accessToken)")
                    print("refreshToken \(response.refreshToken)")
                case .failure(let error):
                    print(error)
                    self.isLoggedIn = false
                }
            }
    }
}
