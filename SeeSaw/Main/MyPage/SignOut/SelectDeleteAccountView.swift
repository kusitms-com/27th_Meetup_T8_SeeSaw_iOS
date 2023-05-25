//
//  SelectDeleteAccountView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct SelectDeleteAccountView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject private var kakaoVM = KakaoAuthViewModel(isLoggedIn: true)
    @StateObject private var myPageVM = MyPageViewModel()
    
    @AppStorage("nickname") var nickname: String = "이오링"
    @AppStorage("onboarding") var isOnboardingCompleted: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("정말 시소를 떠날 건가요?")
                .font(.ssHeading2)
                .foregroundColor(.Gray900)
                .padding(.top, 60)
                .padding(.bottom, 12)
            Text("지금 시소를 탈퇴하게 되면\n모든 데이터와 기록이 사라지고\n복원되지 않아요")
                .lineSpacing(2)
                .font(.ssBlackBody1)
                .foregroundColor(.Gray900)
                .padding(.bottom, 100)
            
            Spacer()
            
            HStack {
                Spacer()
                GifImage("SignOut")
                    .frame(width: 280, height: 280)
                Spacer()
            }
            
            Spacer()
            
            VStack {
                Button {
                    nickname = ""
                    isOnboardingCompleted = false
                    myPageVM.deleteUser()
                    kakaoVM.handleKakaoUnlink()
                    authVM.logout()
                } label: {
                    CapsuleButtonView(color: Color.Gray400, text: "탈퇴할래요", size: .large)
                        .padding(.bottom, 12)
                }
                
                Button {
                    dismiss()
                } label: {
                    CapsuleButtonView(color: Color.Gray900, text: "탈퇴 안 할래요", size: .large)
                        .padding(.bottom, 20)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

struct SelectDeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDeleteAccountView()
    }
}
