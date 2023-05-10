//
//  ChangeNicknameView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/02.
//

import SwiftUI

struct ChangeNicknameView: View {
    @State var nickname: String
    enum Field: Hashable {
        case nickname
    }
    @FocusState private var focusField: Field?
    @Binding var showChangeNicknameView: Bool

    var body: some View {
        VStack(spacing: 0) {
            header
                .padding(.vertical, 20)
            
            Divider()
            
            Spacer()
            textField
                .padding(44)
            Spacer()
            
            buttonView
                .padding([.bottom, .horizontal], 24)
        }
        .frame(width: 360, height: 324)
        .background(Color.Gray100)
        .cornerRadius(20).shadow(radius: 20)
    }
    
    var header: some View {
        ZStack {
            Text("닉네임 변경")
                .font(.ssBlackTitle2)
            HStack {
                Spacer()
                Button {
                    self.showChangeNicknameView = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20))
                        .padding(.trailing, 24)
                }
            }
            
        }
        .foregroundColor(Color.Gray500)
    }
    
    var textField: some View {
        VStack {
            TextField("", text: $nickname)
                .textInputAutocapitalization(.never)
                .font(.ssHeading2)
                .focused($focusField, equals: .nickname)
                .onAppear {
                    UITextField.appearance().clearButtonMode = .whileEditing
                }
                .onChange(of: nickname, perform: {
                          nickname = String($0.prefix(10))
                        })
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(nickname.isEmpty ? Color.SeeSawRed : Color.Gray300)
            
            alertEnterNickname
        }
    }
    
    var alertEnterNickname: some View {
        HStack {
            if nickname.isEmpty {
                Text("닉네임을 입력해주세요")
                    .font(.ssBlackBody4)
                    .foregroundColor(Color.SeeSawRed)
            }
            Spacer()
            Text("(\(nickname.count)/10)")
                .font(.ssBlackBody3)
                .foregroundColor(Color.Gray600)
        }
    }
    
    var buttonView: some View {
        Button {
            // TODO: 닉네임 저장
            showChangeNicknameView = false
        } label: {
            CapsuleButtonView(color: nickname.isEmpty ? Color.Gray400 : Color.Gray900,
                              text: "저장하기",
                              size: .large)
        }
        .disabled(nickname.isEmpty)
    }
}
