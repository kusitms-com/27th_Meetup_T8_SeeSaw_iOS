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
            
            Spacer()
            
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
                            .font(.ssBlackCaption)
                            .foregroundColor(Color.SeeSawRed)
                    }
                    Spacer()
                    Text("(\(nickname.count)/10)")
                        .font(.ssBlackBody3)
                        .foregroundColor(Color.Gray600)
                }
            }
            .padding(24)
            
            Spacer()
            Spacer()
            Button {
                
            } label: {
                HStack {
                    Spacer()
                    Text("저장하기")
                    Spacer()
                }
                .font(.ssWhiteTitle2)
                .foregroundColor(.Gray100)
                .frame(height: 42)
                .background(nickname.isEmpty ? Color.Gray400 : Color.Gray900)
                .clipShape(Capsule())
                .padding(8)
            }
        }
        .padding(24)
        .frame(width: 360, height: 440)
        .background(Color.Gray100)
        .cornerRadius(20).shadow(radius: 20)
    }
}
