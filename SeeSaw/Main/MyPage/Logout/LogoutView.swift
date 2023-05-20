//
//  LogoutView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import KeychainSwift
import SwiftUI

struct LogoutView: View {
    @Binding var showLogoutView: Bool
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.2)
                .ignoresSafeArea()
            
            LargePopUpView(title: "로그아웃",
                           isXmarkExist: false,
                           isImageGIF: false,
                           imageName: "LogoutImage",
                           popUpMessage: "로그아웃하시겠어요?",
                           firstButtonContext: "네",
                           secondButtonContext: "아니오",
                           firstButtonAction: logout,
                           secondButtonAction: closePopUpView)
        }
    }
    
    func logout() {
        authVM.logout()
        self.showLogoutView = false
    }
    
    func closePopUpView() {
        self.showLogoutView = false
    }
}
