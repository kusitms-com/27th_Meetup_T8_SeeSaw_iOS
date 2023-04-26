//
//  MyPageView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/26.
//

import SwiftUI

struct MyPageView: View {
    @EnvironmentObject var kakaoAuthVM: KakaoAuthViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("이름: 이안진")
                Text("닉네임: 이오")
                Text("로그인 상태: \(kakaoAuthVM.isLoggedIn! ? "로그인" : "로그아웃")")
                Button {
                    kakaoAuthVM.handleKakaoLogout()
                } label: {
                    Text("카카오 로그아웃")
                        .frame(width: 280, height: 40)
                        .foregroundColor(.black)
                        .background(Color(red: 0.996, green: 0.898, blue: 0))
                        .cornerRadius(6)
                        .padding(.top, 10)
                }
            }
            .navigationTitle("My Page")
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
