//
//  ChangeNicknameView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/02.
//

import SwiftUI

struct ChangeNicknameView: View {
    @AppStorage("nickname") var nickname: String = "이오링"
    @State private var newNickname: String = ""
    var isNotVaildNickname: Bool {
        return !newNickname.isEmpty && !isValidNickname(newNickname)
    }
    enum Field: Hashable {
        case nickname
    }
    @FocusState private var focusField: Field?
    @Binding var showChangeNicknameView: Bool
    @StateObject var myPageVM = MyPageViewModel()

    var body: some View {
        ZStack {
            Color.black.opacity(0.2)
                .ignoresSafeArea()
            
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
        .onAppear { newNickname = nickname }
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
            TextField("", text: $newNickname)
                .textInputAutocapitalization(.never)
                .font(.ssHeading2)
                .focused($focusField, equals: .nickname)
                .onAppear {
                    UITextField.appearance().clearButtonMode = .whileEditing
                }
                .onChange(of: newNickname, perform: {
                          newNickname = String($0.prefix(10))
                        })
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(isNotVaildNickname ? .SeeSawRed : .Gray300)
            
            alertEnterNickname
        }
    }
    
    var alertEnterNickname: some View {
        HStack {
            if newNickname.isEmpty {
                Text("닉네임을 입력해주세요")
                    .font(.ssBlackBody4)
                    .foregroundColor(Color.SeeSawRed)
            } else if isNotVaildNickname {
                Text("한글, 영문, 숫자만 입력할 수 있어요")
                    .font(.ssBlackBody4)
                    .foregroundColor(Color.SeeSawRed)
            }
            Spacer()
            Text("(\(newNickname.count)/10)")
                .font(.ssBlackBody3)
                .foregroundColor(Color.Gray600)
        }
    }
    
    var buttonView: some View {
        Button {
            myPageVM.putNickname(nickname: newNickname)
            nickname = newNickname
            showChangeNicknameView = false
        } label: {
            CapsuleButtonView(color: newNickname.isEmpty ? Color.Gray400 : Color.Gray900,
                              text: "저장하기",
                              size: .large)
        }
        .disabled(isNotVaildNickname == false)
    }
    
    func isValidNickname(_ nickname: String) -> Bool {
        let nicknameRegEx = "[가-힣A-Za-z0-9]{1,10}"

        let nicknamePred = NSPredicate(format: "SELF MATCHES %@", nicknameRegEx)
        return nicknamePred.evaluate(with: nickname)
    }
}
