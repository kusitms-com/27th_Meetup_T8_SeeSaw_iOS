//
//  UserInfoView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct UserInfoView: View {
    @State private var progress = 0.99
    @State var email: String = ""
    @State var nickname: String = ""
//    @FocusState private var focusField: Field?
    var isAllInfoWrited: Bool {
        return !email.isEmpty && !nickname.isEmpty
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            progressBar
                .padding(.bottom, 28)
            
            Text("만나서 반가워요!\n기본 정보를 입력해주세요")
                .font(.ssHeading2)
                .foregroundColor(.GrayBlack)
            
            Divider()
                .padding(.vertical, 24)
            
            emailTextField
                .padding(.bottom, 40)
            nicknameTextField
            
            Spacer()
            
            NavigationLink {
                SignUpCompletionView()
            } label: {
                CapsuleButtonView(color: isAllInfoWrited ? Color.Gray900 : Color.Gray400,
                                  text: "다음",
                                  size: .large)
            }
            .disabled(!isAllInfoWrited)
        }
        .padding(20)
    }
    
    var progressBar: some View {
        HStack(spacing: 8) {
            Rectangle()
                .cornerRadius(12, corners: .allCorners)
                .frame(height: 6)
                .foregroundColor(.SeeSawGreen)
            
            Rectangle()
                .cornerRadius(12, corners: .allCorners)
                .frame(height: 6)
                .foregroundColor(.SeeSawGreen)
        }
    }
    
    var emailTextField: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("이메일")
                .font(.ssWhiteSubTitle)
            
            ZStack(alignment: .trailing) {
                TextField("이메일을 입력해주세요", text: $email)
                    .font(.ssBlackBody1)
                    .padding(.vertical, 8)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                Image(systemName: "checkmark")
                    .foregroundColor(email.isEmpty ? .Gray400 : .SeeSawGreen)
            }
            
            Divider()
        }
    }
    
    var nicknameTextField: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("닉네임")
                .font(.ssWhiteSubTitle)
            
            ZStack(alignment: .trailing) {
                TextField("한글, 영분, 숫자를 10글자 내로 입력해주세요", text: $nickname)
                    .font(.ssBlackBody1)
                    .padding(.vertical, 8)
                    .textInputAutocapitalization(.never)
                Image(systemName: "checkmark")
                    .foregroundColor(nickname.isEmpty ? .Gray400 : .SeeSawGreen)
            }
            
            Divider()
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
