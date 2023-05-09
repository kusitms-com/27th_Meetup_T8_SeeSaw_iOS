//
//  LargePopUpView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/09.
//

import SwiftUI

struct LargePopUpView: View {
    let title: String = "로그아웃"
    let isXmarkExist: Bool = true
    
    let isImageGIF: Bool = false
    let imageName: String = "LogoutImage"
    let text: String = "텍스트"
    
    let firstButtonContext: String = "네"
    let secondButtonContext: String = "아니오"
    var firstButtonAction: () -> Void = { }
    var secondButtonAction: () -> Void = { }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
            
            Divider()
            
            context
            twoButtonsView
        }
        .frame(width: 360, height: 440)
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
        VStack {
            if isImageGIF {
                GifImage(imageName)
                    .frame(height: 200)
            } else {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
                
            Text(text)
                .font(.ssBlackTitle2)
        }
        .padding(36)
    }
    
    var twoButtonsView: some View {
        HStack(spacing: 16) {
            Button {
                firstButtonAction()
            } label: {
                CapsuleButtonView(color: .Gray900,
                                  text: firstButtonContext,
                                  size: .large)
                .padding([.bottom, .leading], 24)
            }
            
            Button {
                secondButtonAction()
            } label: {
                CapsuleButtonView(color: .Gray400,
                                  text: secondButtonContext,
                                  size: .large)
                .padding([.bottom, .trailing], 24)
            }
        }
    }
}

struct LargePopUpView_Previews: PreviewProvider {
    static var previews: some View {
        LargePopUpView()
    }
}
