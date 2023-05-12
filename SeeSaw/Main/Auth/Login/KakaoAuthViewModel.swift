//
//  KakaoAuthViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/21.
//

import Combine
import Foundation
import KakaoSDKUser

class KakaoAuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool?
    
    init(isLoggedIn: Bool) {
        self.isLoggedIn = false
    }
    
    func handleKakaoLogin() {
        if UserApi.isKakaoTalkLoginAvailable() {
            loginWithKakaoTalkApp()
        } else {
            loginWithKakaoTallWebView()
        }
    }
    
    func loginWithKakaoTalkApp() {
        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
            guard let oauthToken = oauthToken else {
                print("nil oauthtoken")
                return
            }
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoTalk() success.")
                print("DEBUG: \(oauthToken)")
            }
            self.isLoggedIn = true
        }
    }
    
    func loginWithKakaoTallWebView() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            guard let idToken = oauthToken?.idToken else {
                print("nil oauthtoken")
                return
            }
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoAccount() success.")
                print("DEBUG: \(idToken)")
                // do something
                _ = oauthToken
            }
            self.isLoggedIn = true
        }
    }
    
    func handleKakaoLogout() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            } else {
                print("logout() success.")
            }
            self.isLoggedIn = false
        }
    }
}
