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
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    let keychain = KeychainSwift()
    
    @Published var isLoggedIn: Bool?
    @Published var isRegenerated: Bool?
    @Published var isOnboardingCompleted: Bool?
    
    init(isLoggedIn: Bool) {
        self.isLoggedIn = false
        self.isRegenerated = false
        self.isOnboardingCompleted = false
    }
    
    func login(req: PostLoginRequest) {
        let url = "\(baseUrl)/auth/login"
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
                        print("DEBUG authVM login: not 200 \(data)")
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func regenerateToken(completion: @escaping (String) -> Void) {
        let url = "\(baseUrl)/auth/regenerate-token"
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
                    self.getNickname { serverNickname in
                        completion(serverNickname)
                    }
                case .failure(let error):
                    print(error)
                    self.isLoggedIn = false
                }
            }
        
        self.isRegenerated = true
    }
    
    func getNickname(completion: @escaping (String) -> Void) {
        let url = "\(baseUrl)/api/user"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetNicknameResponse.self) { response in
                switch response.result {
                case .success(let res):
                    self.isOnboardingCompleted = true
                    completion(res.result)
                case .failure(let error):
                    print("DEBUG getNickname: \(error)")
                }
            }
    }
    
    func logout() {
        keychain.delete("accessToken")
        keychain.delete("accessToken")
        
        isLoggedIn = false
    }
}
