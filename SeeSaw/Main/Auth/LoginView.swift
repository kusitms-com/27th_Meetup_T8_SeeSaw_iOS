//
//  LoginView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/21.
//

import AuthenticationServices
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var kakaoAuthVM: KakaoAuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Apple Login")
                    SignInWithAppleButton { request in
                        request.requestedScopes = [.email, .fullName]
                    } onCompletion: { result in
                        switch result {
                        case .success(let auth):
                            switch auth.credential {
                            case let credential as ASAuthorizationAppleIDCredential:
                                print(credential.identityToken ?? "DEBUG: credential.identityToken is nil")
                            default:
                                print("DEBUG: sign success but credetial is nil")
                                // break
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                    .frame(width: 280, height: 60)
                }
                    .padding(.bottom, 60)
                
                VStack {
                    Text("Kakao Login")
                    Button {
                        kakaoAuthVM.handleKakaoLogin()
                    } label: {
                        Image("KakaoLoginWideButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280)
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
