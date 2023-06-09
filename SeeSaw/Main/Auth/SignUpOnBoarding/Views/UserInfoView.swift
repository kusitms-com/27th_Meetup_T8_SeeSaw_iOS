//
//  UserInfoView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct UserInfoView: View {
    @StateObject var signUpVM = SignUpViewModel()
    
    @State var email: String = ""
    @AppStorage("nickname") var nickname: String = ""
    @State var newNickname: String = ""
    @Binding var agreeMarketing: Bool
    
    var isNotVaildEmail: Bool {
        return !email.isEmpty && !isValidEmail(email)
    }
    var isNotVaildNickname: Bool {
        return !newNickname.isEmpty && !isValidNickname(newNickname)
    }
    var allValidate: Bool {
        return isNotVaildEmail == false && isNotVaildNickname == false && newNickname.isEmpty == false && email.isEmpty == false
    }
    
    @State private var isEmailChecked: Bool = false
    @State private var isEmailAvailable: Bool = false
    
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
                nickname = newNickname
                signUpVM.postUserInfo(agreeMarketing: agreeMarketing, email: email, nickname: newNickname)
            })
        }
        .padding(20)
        .background(Color.Gray200)
        .onAppear {
            signUpVM.getEmail { socialEmail in
                email = socialEmail
            }
        }
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
                    .disabled(true)
                    .font(.ssBlackBody1)
                    .padding(.vertical, 10)
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
                    .font(.ssWhiteBody3)
                    .foregroundColor(.SeeSawRed)
            } else if isEmailChecked && isEmailAvailable == false {
                Text("중복된 이메일이에요")
                    .font(.ssWhiteBody3)
                    .foregroundColor(.SeeSawRed)
            }
        }
    }
    
    var nicknameTextField: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("닉네임")
                .font(.ssWhiteSubTitle)
            
            ZStack(alignment: .trailing) {
                TextField("한글, 영문, 숫자를 10글자 내로 입력해주세요", text: $newNickname)
                    .font(.ssBlackBody1)
                    .padding(.vertical, 10)
                    .textInputAutocapitalization(.never)
                    .onChange(of: newNickname, perform: {
                              newNickname = String($0.prefix(10))
                            })
                Image(systemName: "checkmark")
                    .foregroundColor(newNickname.isEmpty ? .Gray400 : (isNotVaildNickname ? .SeeSawRed : .SeeSawGreen))
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(isNotVaildNickname ? .SeeSawRed : .Gray300)
                .padding(.bottom, 8)
            
            if isNotVaildNickname {
                Text("한글, 영문, 숫자만 입력할 수 있어요")
                    .font(.ssWhiteBody3)
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
