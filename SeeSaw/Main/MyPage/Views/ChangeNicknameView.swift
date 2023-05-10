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
        VStack {
            header
            
            Divider()
            
            Spacer()
            
            textField
            
            Spacer()
            Spacer()
            
            Button {
                // TODO: 닉네임 저장
                showChangeNicknameView = false
            } label: {
                CapsuleButtonView(color: nickname.isEmpty ? Color.Gray400 : Color.Gray900,
                                  text: "저장하기",
                                  size: .large)
                    .padding(8)
            }
            .disabled(nickname.isEmpty)
        }
        .padding(24)
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
                        .font(.system(size: 16))
                        .padding(.trailing, 24)
                }
            }
            
        }
        .foregroundColor(Color.Gray500)
        .padding(.vertical)
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

/*
 let title: String
 let isXmarkExist: Bool
 let isImageExist: Bool
 
 let isImageGIF: Bool
 let imageName: String
 let text: String
 
 let buttonContext: String
 let buttonColor: Color
 var buttonAction: () -> Void
 
 var body: some View {
     VStack(spacing: 0) {
         headerView
         
         Divider()
         
         context
         buttonsView
     }
     .frame(width: 360, height: 324)
     .background(Color.Gray100)
     .cornerRadius(20).shadow(radius: 20)
 }
 
 
 var context: some View {
     VStack(spacing: 0) {
         Spacer()
         
         if isImageExist && isImageGIF {
             GifImage(imageName)
                 .frame(height: 92)
         } else if isImageExist {
             Image(imageName)
                 .resizable()
                 .scaledToFit()
                 .frame(height: 92)
         }
             
         Text(text)
             .font(.ssBlackTitle2)
         
         Spacer()
     }
     .padding(36)
 }
 
 var buttonsView: some View {
     Button {
         buttonAction()
     } label: {
         CapsuleButtonView(color: buttonColor,
                           text: buttonContext,
                           size: .large)
         .padding([.bottom, .horizontal], 24)
     }
 }
 */
