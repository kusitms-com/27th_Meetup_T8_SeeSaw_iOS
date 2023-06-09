//
//  ContentView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/15.
//

import KeychainSwift
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVM: AuthViewModel
    let keychain = KeychainSwift()
    
    @AppStorage("nickname") var nickname: String = ""
    
    var body: some View {
        VStack {
            if authVM.isLoggedIn ?? false {
                // 토큰 재생성 및 로그인 완료
                if authVM.isOnboardingCompleted ?? false {
                    // 온보딩 완료
                    SeeSawTabView()
                        .environmentObject(authVM)
                } else {
                    // 온보딩 미완료
                    AgreeTermsView()
                        .environmentObject(authVM)
                }
            } else if authVM.isRegenerated ?? false {
                // 토큰 재생성 완료으나 로그인되지 않음 (토큰 유효기간 만료 혹은 유저 아님)
                LoginView()
            } else {
                // 토큰 재생성 미완료
                LaunchScreenView()
            }
        }
        .onAppear {
            print("DEBUG ContentView: onappear")
            authVM.regenerateToken { serverNickname in
                nickname = serverNickname
            }
        }
    }
}
