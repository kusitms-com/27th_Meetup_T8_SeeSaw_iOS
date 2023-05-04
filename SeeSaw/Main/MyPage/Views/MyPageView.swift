//
//  MyPageView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/26.
//

import SwiftUI

struct MyPageView: View {
    @State private var nickname = "에몽"
    @State private var showChangeNicknameView = false
    @State private var showLogoutView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        greenRectangle
                        userNicknameRow
                    }
                    .padding(.bottom, 56)
                    
                    MyPageTwoRow(topTitle: "알림", bottomTitle: "공지사항", isChevronExist: true)
                    
                    MyPageTwoRow(topTitle: "개인정보 정책", bottomTitle: "문의하기", isChevronExist: true)
                    
                    Button {
                        showLogoutView = true
                    } label: {
                        MypageRow(isRowTop: true, title: "로그아웃", isChevronExist: false)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .background(Color.Gray200)
                
                if $showChangeNicknameView.wrappedValue {
                    ChangeNicknameView(showChangeNicknameView: self.$showChangeNicknameView)
                }
                
                if $showLogoutView.wrappedValue {
                    LogoutView(showLogoutView: self.$showLogoutView)
                }
            }
        }
    }
    
    var greenRectangle: some View {
        Rectangle()
            .frame(width: 100, height: 4)
            .foregroundColor(.SeeSawGreen)
            .padding(.top, 40)
            .padding(.bottom, 16)
    }
    
    var changeNicknameButton: some View {
        ZStack {
            Circle()
                .frame(width: 28, height: 28)
                .foregroundColor(Color.Gray300)
            Image(systemName: "pencil.line")
                .frame(width: 16, height: 16)
                .foregroundColor(Color.Gray500)
        }
    }
    
    var userNicknameRow: some View {
        HStack {
            Text(nickname)
                .font(.ssHeading1)
                .foregroundColor(Color.GrayBlack)
            Text("님")
                .font(.ssHeading1)
                .foregroundColor(Color.Gray600)
            
            Button {
                showChangeNicknameView = true
            } label: {
                changeNicknameButton
            }
            
            Spacer()
        }
    }
}

struct MyPageTwoRow: View {
    let topTitle: String
    let bottomTitle: String
    let isChevronExist: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                MypageRow(isRowTop: true, title: topTitle, isChevronExist: isChevronExist)
            }
            
            Divider()
            
            NavigationLink {
                
            } label: {
                MypageRow(isRowTop: false, title: bottomTitle, isChevronExist: isChevronExist)
            }
        }
        .padding(.bottom, 16)
    }
}

struct MypageRow: View {
    // .top, .bottom enum으로 만들기
    let isRowTop: Bool
    let title: String
    let isChevronExist: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 40)
                .cornerRadius(10, corners: isRowTop ? [.topLeft, .topRight] : [.bottomLeft, .bottomRight])
                .foregroundColor(Color.Gray100)
                .padding(0)
            
            HStack {
                Text(title)
                Spacer()
                if isChevronExist { Image(systemName: "chevron.right") }
            }
            .font(.ssBlackBody2)
            .foregroundColor(.black)
            .padding(.horizontal, 10)
        }
    }
}

/*
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
 */

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
