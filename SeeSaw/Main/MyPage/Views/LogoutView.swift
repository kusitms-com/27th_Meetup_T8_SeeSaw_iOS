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
        VStack {
            Text("로그아웃")
                .font(.ssBlackTitle2)
                .foregroundColor(Color.Gray500)
            
            Divider()
            
            Image("LogoutImage")
            
            Text("로그아웃하시겠어요?")
            
            HStack {
                Button {
                    // TODO: 로그아웃
                    showLogoutView = false
                } label: {
                    CapsuleButtonView(color: Color.Gray900, text: "네", size: .small)
                        .padding(8)
                }
                Button {
                    showLogoutView = false
                } label: {
                    CapsuleButtonView(color: Color.Gray400, text: "아니요", size: .small)
                        .padding(8)
                }
            }
        }
        .padding(24)
        .frame(width: 360, height: 440)
        .background(Color.Gray100)
        .cornerRadius(20).shadow(radius: 20)
    }
}
