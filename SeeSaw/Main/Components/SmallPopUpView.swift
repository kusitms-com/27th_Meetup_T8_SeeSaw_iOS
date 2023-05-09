//
//  SmallPopUpView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/09.
//

import SwiftUI

struct SmallPopUpView: View {
    let title: String = "로그아웃"
    let isXmarkExist: Bool = true
    let isImageExist: Bool = true
    
    let isImageGIF: Bool = false
    let imageName: String = "LogoutImage"
    let text: String = "텍스트"
    
    let buttonContext: String = "네"
    let buttonColor: Color = Color.Gray900
    var buttonAction: () -> Void = { }
    
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
    var headerView: some View {
        ZStack {
            Text(title)
                .font(.ssBlackTitle2)
            if isXmarkExist {
                HStack {
                    Spacer()
                    Image(systemName: "xmark")
                        .font(.system(size: 16))
                        .padding(.trailing, 24)
                }
            }
        }
        .foregroundColor(Color.Gray500)
        .padding(.vertical)
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
}

struct SmallPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        SmallPopUpView()
    }
}
