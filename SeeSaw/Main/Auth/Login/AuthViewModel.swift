//
//  AuthViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/08.
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
                                      forKey: "accessToken",
                                      withAccess: .accessibleWhenUnlocked)
                    self.keychain.set(response.refreshToken,
                                      forKey: "refreshToken",
                                      withAccess: .accessibleWhenUnlocked)
                    print("accessToken \(response.accessToken)")
                    print("refreshToken \(response.refreshToken)")
                case .failure(let error):
                    print(error)
                }
            }
    }
}

/*
 func login(req: PostLoginRequest) {
     let url = "http://ec2-3-36-172-10.ap-northeast-2.compute.amazonaws.com/auth/login"
     let parameters: [String: Any] = [
         "id_token": req.idToken,
         "access_token": req.accessToken,
         "refresh_token": req.refreshToken,
         "provider": req.provider
     ]
     let headers: HTTPHeaders = [
         "Content-Type": "application/json"
     ]
     
     AF.request(url,
                method: .post,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: headers)
         .responseDecodable(of: PostLoginResponse.self) { response in
             switch response.result {
             case .success(let response):
                 self.keychain.set(response.accessToken,
                                   forKey: "accessToken",
                                   withAccess: .accessibleWhenUnlocked)
                 self.keychain.set(response.refreshToken,
                                   forKey: "refreshToken",
                                   withAccess: .accessibleWhenUnlocked)
                 print("accessToken \(response.accessToken)")
                 print("refreshToken \(response.refreshToken)")
             case .failure(let error):
                 print(error)
             }
         }
 }
 */