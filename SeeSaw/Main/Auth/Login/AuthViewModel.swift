//
//  AuthViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/09.
//

import Alamofire
import Foundation
import KeychainSwift

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool?
    @Published var isRegenerated: Bool?
    let keychain = KeychainSwift()
    
    init(isLoggedIn: Bool) {
        self.isLoggedIn = false
        self.isRegenerated = false
    }
    
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
            .responseData { response in
                switch response.result {
                case .success:
                    let decoder = JSONDecoder()
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let data = response.value else { return }
                    switch statusCode {
                    case 200:
                        guard let loginRes = try? decoder.decode(PostLoginResponse.self, from: data) else { return }
                        self.keychain.set(loginRes.accessToken,
                                          forKey: "accessToken",
                                          withAccess: .accessibleWhenUnlocked)
                        self.keychain.set(loginRes.refreshToken,
                                          forKey: "refreshToken",
                                          withAccess: .accessibleWhenUnlocked)
                        print("DEBUG accessToken: \(loginRes.accessToken)")
                        print("DEBUG refreshToken: \(loginRes.refreshToken)")
                        print("keychain \(self.keychain.get("refreshToken") ?? "keychain에 없음")")
                        self.isLoggedIn = true
                    case 409:
                        guard let errorRes = try? decoder.decode(PostLogin409Response.self, from: data) else { return }
                        print(errorRes.message)
                    default:
                        print("DEBUG: not 200 \(data)")
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func regenerateToken() {
        let url = "http://ec2-3-36-172-10.ap-northeast-2.compute.amazonaws.com/auth/regenerate-token"
        let parameters: [String: Any] = [
            "refresh_token": keychain.get("refreshToken") ?? ""
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
        
        self.isRegenerated = true
    }
    
    func logout() {
        keychain.delete("accessToken")
        keychain.delete("accessToken")
        
        isLoggedIn = false
    }
}
