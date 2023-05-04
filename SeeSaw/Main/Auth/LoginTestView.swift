//
//  LoginTestView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/21.
//

import AuthenticationServices
import SwiftUI

struct LoginTestView: View {
    @EnvironmentObject var kakaoAuthVM: KakaoAuthViewModel
    @State private var idTokenString = "nilnil"
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Apple Login")
                    Text("idTokenString: \(idTokenString)")
                        .padding(20)
                        .textSelection(.enabled)
                        
                    SignInWithAppleButton { request in
                        request.requestedScopes = [.email, .fullName]
                    } onCompletion: { result in
                        switch result {
                        case .success(let auth):
                            switch auth.credential {
                            case let credential as ASAuthorizationAppleIDCredential:
                                print("DEBUG: apple login success, credential: \(credential)")
                                print("DEBUG description: \(credential.description)")
                                if let authCode = credential.authorizationCode {
                                    print("DEBUG authcode: \(String(data: authCode, encoding: .utf8) ?? "nil")")
                                }
                                print("DEBUG email: \(credential.email ?? "nil")")
                                print("DEBUG user: \(credential.user)")
                                print("DEBUG auth scopes: \(credential.authorizedScopes)")
                                
                                if let fullName = credential.fullName {
                                    print("DEBUG fullname: \(fullName)")
                                }
                                
                                print("DEBUG realuserstatus: \(credential.realUserStatus)")
                                print("DEBUG state: \(credential.state ?? "nil")")
                                if let idToken = credential.identityToken {
                                    idTokenString = String(data: idToken, encoding: .utf8) ?? "nil"
                                    print("DEBUG identityToken: \(idTokenString)")
                                    print("DEBUG identityToken.email: \(decode(jwtToken: idTokenString)["email"] as? String ?? "")")
                                }
                            default:
                                print("DEBUG: sign success but credetial is nil")
                                // break
                            }
                        case .failure(let error):
                            print("DEBUG: apple login fail: \(error)")
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
    
    private func decode(jwtToken jwt: String) -> [String: Any] {
        
        func base64UrlDecode(_ value: String) -> Data? {
            var base64 = value
                .replacingOccurrences(of: "-", with: "+")
                .replacingOccurrences(of: "_", with: "/")

            let length = Double(base64.lengthOfBytes(using: String.Encoding.utf8))
            let requiredLength = 4 * ceil(length / 4.0)
            let paddingLength = requiredLength - length
            if paddingLength > 0 {
                let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
                base64 += padding
            }
            return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
        }

        func decodeJWTPart(_ value: String) -> [String: Any]? {
            guard let bodyData = base64UrlDecode(value),
                  let json = try? JSONSerialization.jsonObject(with: bodyData, options: []), let payload = json as? [String: Any] else {
                return nil
            }

            return payload
        }
        
        let segments = jwt.components(separatedBy: ".")
        return decodeJWTPart(segments[1]) ?? [:]
    }
}

struct LoginTestView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTestView()
    }
}
