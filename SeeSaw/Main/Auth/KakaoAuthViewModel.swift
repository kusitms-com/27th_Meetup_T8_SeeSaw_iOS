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
    func handleKakaoLogin() {
        // 카카오톡 앱 실행 가능 여부 파악
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 앱 실행 가능 O
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")

                    // do something
                    _ = oauthToken
                }
            }
        } else {
            // 카카오톡 앱 실행 불가능 X 웹뷰로 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    } else {
                        print("loginWithKakaoAccount() success.")

                        // do something
                        _ = oauthToken
                    }
                }
        }
    }
    
    func handleKakaoLogout() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            } else {
                print("logout() success.")
            }
        }
    }
}
