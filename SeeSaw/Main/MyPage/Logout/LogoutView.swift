//
//  LogoutView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct LogoutView: View {
    @Binding var showLogoutView: Bool
    
    var body: some View {
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
    
    func logout() {
        
    }
    
    func closePopUpView() {
        self.showLogoutView = false
    }
}
