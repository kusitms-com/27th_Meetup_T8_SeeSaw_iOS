//
//  LoginView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import AuthenticationServices
import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("시소와 함께\n일과 삶 사이의 균형을 찾아보세요")
                .font(.ssHeading2)
                .padding(.top, 60)
            
            Spacer()
            Image("LogoutImage")
            Spacer()
            
            Button {
                // TODO: kakao login
            } label: {
                kakaoLoginButton
            }
            
            SignInWithAppleButton(.signIn) { request in
                print(request)
            } onCompletion: { result in
                print(result)
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
        }
        .padding(20)
    }
    
    var kakaoLoginButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.KakaoColor)
                .frame(height: 60)
            HStack {
                Image("KakaoLoginLogo")
                Text("Login with Kakao")
                    .font(.system(size: 24))
                    .foregroundColor(.black.opacity(0.85))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
