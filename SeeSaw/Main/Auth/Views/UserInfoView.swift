//
//  UserInfoView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct UserInfoView: View {
    @State private var progress = 0.99
    var isAllInfoWrited: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProgressView(value: progress)
                .padding(.vertical, 28)
            
            Text("만나서 반가워요!\n기본 정보를 입력해주세요")
                .font(.ssHeading2)
                .foregroundColor(.GrayBlack)
            Text("시소가 여러분을 어떻게 불러드릴까요?")
                .font(.ssWhiteBody2)
                .foregroundColor(.Gray600)
                .padding(.vertical, 20)
            
            Divider()
                .padding(.bottom, 24)
            
            Text("이메일")
            Text("닉네임")
            
            Spacer()
            
            Button {
                
            } label: {
                CapsuleButtonView(isActive: isAllInfoWrited,
                                  text: "다음", size: .large)
            }
            .disabled(!isAllInfoWrited)
        }
        .padding(20)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
