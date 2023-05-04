//
//  ChangeNicknameView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/02.
//

import SwiftUI

struct ChangeNicknameView: View {
    @State private var nickname = "이오"
    enum Field: Hashable {
        case nickname
    }
    @FocusState private var focusField: Field?
    @Binding var showChangeNicknameView: Bool

    var body: some View {
        VStack {
            title
            Divider()
            
            Spacer()
            
            textField
            
            Spacer()
            Spacer()
            
            Button {
                // TODO: 닉네임 저장
                showChangeNicknameView = false
            } label: {
                CapsuleButtonView(isActive: !nickname.isEmpty, text: "저장하기", size: .large)
                    .padding(8)
            }
            .disabled(nickname.isEmpty)
        }
        .padding(24)
        .frame(width: 360, height: 324)
        .background(Color.Gray100)
        .cornerRadius(20).shadow(radius: 20)
    }
    
    var title: some View {
        ZStack {
            HStack {
                Spacer()
                Button {
                    self.showChangeNicknameView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color.Gray500)
                        .frame(width: 16, height: 16)
                }
            }
            Text("닉네임 변경")
                .font(.ssBlackTitle2)
                .foregroundColor(Color.Gray500)
        }
    }
    
    var textField: some View {
        VStack {
            ZStack(alignment: .trailing) {
                TextField("", text: $nickname)
                    .textInputAutocapitalization(.never)
                    .font(.ssHeading2)
                    .focused($focusField, equals: .nickname)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(nickname.isEmpty ? Color.SeeSawRed : Color.Gray300)
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
        .padding(24)
    }
}
