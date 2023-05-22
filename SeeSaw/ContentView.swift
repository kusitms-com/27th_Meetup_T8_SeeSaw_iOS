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
    @AppStorage("onboarding") var isOnboardingCompleted: Bool = false
    
    var body: some View {
        VStack {
            if authVM.isLoggedIn ?? false {
                // 토큰 재생성 및 로그인 완료
                if isOnboardingCompleted {
                    // 온보딩 완료
                    SeeSawTabView()
                } else {
                    // 온보딩 미완료
                    AgreeTermsView()
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
            print("실행")
            authVM.regenerateToken()
        }
    }
}
