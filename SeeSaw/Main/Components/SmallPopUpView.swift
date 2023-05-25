//
//  SmallPopUpView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/09.
//

import SwiftUI

struct SmallPopUpView: View {
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
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            
            if isImageExist && isImageGIF {
                GifImage(imageName)
                    .frame(height: 92)
            } else if isImageExist {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 116, height: 116)
            }
                
            Text(text)
                .font(.ssBlackBody1)
                .lineSpacing(4)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
    
    var buttonsView: some View {
        Button {
            buttonAction()
        } label: {
            CapsuleButtonView(color: buttonColor,
                              text: buttonContext,
                              size: .large)
            .padding([.bottom, .horizontal], 32)
        }
    }
}
