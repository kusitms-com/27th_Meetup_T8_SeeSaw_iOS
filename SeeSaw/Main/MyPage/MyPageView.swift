//
//  MyPageView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/26.
//

import MessageUI
import SwiftUI

struct MyPageView: View {
    @AppStorage("nickname") var nickname: String = ""
    @State private var showChangeNicknameView = false
    @State private var showLogoutView = false
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    greenRectangle
                        .padding(.top, 40)
                        .padding(.bottom, 16)
                    userNicknameRow
                }
                .padding(.bottom, 36)
                
                VStack(spacing: 0) {
                    NavigationLink {
                        notiView
                    } label: {
                        MyPageRow(isRowTop: true,
                                  title: "알림",
                                  isChevronExist: true)
                    }
                    
                    Divider()
                    
                    NavigationLink {
                        announceView
                    } label: {
                        MyPageRow(isRowTop: false,
                                  title: "공지사항",
                                  isChevronExist: true)
                    }
                }
                .padding(.bottom, 16)
                
                VStack(spacing: 0) {
                    provisioningViewRow
                    
                    Divider()
                    
                    if MFMailComposeViewController.canSendMail() {
                        Button {
                            self.isShowingMailView.toggle()
                        } label: {
                            MyPageRow(isRowTop: false,
                                      title: "문의하기",
                                      isChevronExist: true)
                        }
                    } else {
                        NavigationLink {
                            VStack {
                                Spacer()
                                Text("seesaw.8attery@gmail.com 로 문의주시기 바랍니다")
                                Spacer()
                                Spacer()
                            }
                            .background(Color.Gray200)
                        } label: {
                            MyPageRow(isRowTop: false,
                                      title: "문의하기",
                                      isChevronExist: true)
                        }
                    }
                }
                .padding(.bottom, 16)
                
                VStack(spacing: 0) {
                    logoutViewRow
                    Divider()
                    signOutViewRow
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .background(Color.Gray200)
            .sheet(isPresented: $isShowingMailView) {
                MailView(isShowing: self.$isShowingMailView, result: self.$result)
            }
            
        if $showChangeNicknameView.wrappedValue {                        ChangeNicknameView(nickname: self.nickname,
                                   showChangeNicknameView: self.$showChangeNicknameView)
            }
            
            if $showLogoutView.wrappedValue {
                LogoutView(showLogoutView: self.$showLogoutView)
            }
        }
        .navigationTitle("마이페이지")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var greenRectangle: some View {
        Rectangle()
            .frame(width: 80, height: 4)
            .foregroundColor(.SeeSawGreen)
    }
    
    var userNicknameRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(nickname)
                    .font(.ssHeading1)
                    .foregroundColor(Color.GrayBlack)
                Text("님")
                    .font(.ssHeading1)
                    .foregroundColor(Color.Gray600)
            }
            .padding(.trailing, 16)
            
            Button {
                showChangeNicknameView = true
            } label: {
                changeNicknameImage
            }
            
            Spacer()
        }
    }
    
    var changeNicknameImage: some View {
        Image("ChangeNickname")
            .frame(width: 16, height: 16)
            .foregroundColor(Color.Gray500)
    }
    
    // 마이페이지 메뉴 Views
    var notiView: some View {
        VStack {
            Spacer()
            Text("알림이 없습니다")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray500)
            HStack {
                Spacer()
            }
            Spacer()
        }
        .background(Color.Gray200)
        .navigationTitle("알림")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var announceView: some View {
        VStack {
            Spacer()
            Text("공지사항이 없습니다")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray500)
            HStack {
                Spacer()
            }
            Spacer()
        }
        .background(Color.Gray200)
        .navigationTitle("공지사항")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var provisioningViewRow: some View {
        NavigationLink {
            ProvisioningView()
        } label: {
            MyPageRow(isRowTop: true,
                      title: "권한설정",
                      isChevronExist: true)
        }
    }
    
    var logoutViewRow: some View {
        Button {
            showLogoutView = true
        } label: {
            MyPageRow(isRowTop: true,
                      title: "로그아웃",
                      isChevronExist: false)
        }
    }
    
    var signOutViewRow: some View {
        NavigationLink {
            SignOutView()
        } label: {
            MyPageRow(isRowTop: false,
                      title: "회원탈퇴",
                      isChevronExist: true)
        }
    }
}

 struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
 }
