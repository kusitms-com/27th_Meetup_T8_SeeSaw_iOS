//
//  UserInfoView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct UserInfoView: View {
    @State var email: String = ""
    @State var nickname: String = ""
    @Binding var agreeMarketing: Bool
    @StateObject var signUpVM = SignUpViewModel()
    var isNotVaildEmail: Bool {
        return !email.isEmpty && !isValidEmail(email)
    }
    var isNotVaildNickname: Bool {
        return !nickname.isEmpty && !isValidNickname(nickname)
    }
    var allValidate: Bool {
        return isValidEmail(email) && isValidNickname(nickname)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            progressBar
                .padding(.bottom, 28)
            
            Text("만나서 반가워요!\n기본 정보를 입력해주세요")
                .font(.ssHeading2)
                .foregroundColor(.GrayBlack)
            
            Divider()
                .padding(.vertical, 20)
            
            emailTextField
                .padding(.bottom, 40)
            nicknameTextField
            
            Spacer()
            
            NavigationLink {
                SignUpCompletionView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                CapsuleButtonView(color: allValidate ? Color.Gray900 : Color.Gray400,
                                  text: "다음",
                                  size: .large)
            }
            .disabled(allValidate == false)
            .simultaneousGesture(TapGesture().onEnded {
                signUpVM.postUserInfo(agreeMarketing: agreeMarketing, email: email, nickname: nickname)
            })
        }
        .padding(20)
        .background(Color.Gray200)
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
                    .foregroundColor(email.isEmpty ? .Gray400 : (isNotVaildEmail ? .SeeSawRed : .SeeSawGreen))
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(isNotVaildEmail ? .SeeSawRed : .Gray300)
                .padding(.bottom, 8)
            
            if isNotVaildEmail {
                Text("올바른 이메일 형식이 아니에요")
                    .font(.ssBlackBody4)
                    .foregroundColor(.SeeSawRed)
            }
        }
    }
    
    var nicknameTextField: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("닉네임")
                .font(.ssWhiteSubTitle)
            
            ZStack(alignment: .trailing) {
                TextField("한글, 영문, 숫자를 10글자 내로 입력해주세요", text: $nickname)
                    .font(.ssBlackBody1)
                    .padding(.vertical, 8)
                    .textInputAutocapitalization(.never)
                    .onChange(of: nickname, perform: {
                              nickname = String($0.prefix(10))
                            })
                Image(systemName: "checkmark")
                    .foregroundColor(nickname.isEmpty ? .Gray400 : (isNotVaildNickname ? .SeeSawRed : .SeeSawGreen))
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(isNotVaildNickname ? .SeeSawRed : .Gray300)
                .padding(.bottom, 8)
            
            if isNotVaildNickname {
                Text("한글, 영문, 숫자만 입력할 수 있어요")
                    .font(.ssBlackBody4)
                    .foregroundColor(.SeeSawRed)
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidNickname(_ nickname: String) -> Bool {
        let nicknameRegEx = "[가-힣A-Za-z0-9]{1,10}"

        let nicknamePred = NSPredicate(format: "SELF MATCHES %@", nicknameRegEx)
        return nicknamePred.evaluate(with: nickname)
    }
}
