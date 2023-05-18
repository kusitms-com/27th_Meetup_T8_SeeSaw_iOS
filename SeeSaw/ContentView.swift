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
                if isOnboardingCompleted {
                    SeeSawTabView()
                } else {
                    AgreeTermsView()
                }
            } else if authVM.isRegenerated ?? false {
                LoginView()
            } else {
                LaunchScreenView()
            }
        }
        .onAppear {
            print("실행")
            authVM.regenerateToken()
        }
    }
}
