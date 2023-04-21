//
//  LoginView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/21.
//

import AuthenticationServices
import SwiftUI

struct LoginView: View {
    var body: some View {
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
