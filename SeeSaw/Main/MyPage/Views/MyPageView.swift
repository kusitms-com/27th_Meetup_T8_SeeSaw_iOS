//
//  MyPageView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/26.
//

import SwiftUI

struct MyPageView: View {
    @State private var showChangeNicknameView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Rectangle()
                            .frame(width: 100, height: 4)
                            .foregroundColor(.SeeSawGreen)
                            .padding(.top, 40)
                            .padding(.bottom, 16)
                        HStack {
                            Text("에몽")
                                .font(.ssHeading1)
                                .foregroundColor(Color.GrayBlack)
                            Text("님")
                                .font(.ssHeading1)
                                .foregroundColor(Color.Gray600)
                            
                            Button {
                                showChangeNicknameView = true
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(Color.Gray300)
                                    Image(systemName: "pencil.line")
                                        .frame(width: 16, height: 16)
                                        .foregroundColor(Color.Gray500)
                                }
                            }
                            
                            Spacer()
                        }
                    }
                    .padding(.bottom, 56)
                    
                    MyPageTwoRow(topTitle: "알림", bottomTitle: "공지사항")
                    
                    MyPageTwoRow(topTitle: "개인정보 정책", bottomTitle: "문의하기")
                    
                    MyPageTwoRow(topTitle: "로그아웃", bottomTitle: "회원탈퇴")
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .background(Color.Gray200)
                
                if $showChangeNicknameView.wrappedValue {
                    ChangeNicknameView(showChangeNicknameView: self.$showChangeNicknameView)
                }
            }
        }
    }
}

struct MyPageTwoRow: View {
    let topTitle: String
    let bottomTitle: String
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                MypageRow(isRowTop: true, title: topTitle)
            }
            
            Divider()
            
            NavigationLink {
                
            } label: {
                MypageRow(isRowTop: false, title: bottomTitle)
            }
        }
        .padding(.bottom, 16)
    }
}

struct MypageRow: View {
    // .top, .bottom enum으로 만들기
    let isRowTop: Bool
    let title: String
    
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
                Image(systemName: "chevron.right")
            }
            .font(.ssBlackBody2)
            .foregroundColor(.black)
            .padding(.horizontal, 10)
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
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
