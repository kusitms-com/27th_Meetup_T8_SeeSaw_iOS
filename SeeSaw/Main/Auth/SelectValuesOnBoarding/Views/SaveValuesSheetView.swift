//
//  SaveValuesSheetView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/16.
//

import SwiftUI

struct SaveValuesSheetView: View {
    @Binding var isModalPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Spacer()
                Text("가치 저장")
                    .font(.ssBlackTitle2)
                    .foregroundColor(.Gray500)
                Spacer()
            }
            .padding(.top, 12)
            
            Divider()
                .padding(.bottom, 12)
            Text("에몽님이 설정한 올해의 가치예요")
                .foregroundColor(.Gray800)
            Text("내년 1월 1일 전까지 수정할 수 없어요\n이대로 저장하시겠어요?")
                .font(.ssBlackTitle1)
            
            Spacer()
            
            HStack(spacing: 16) {
                Rectangle()
                    .cornerRadius(90, corners: .allCorners)
                    .frame(height: 46)
                    .foregroundColor(.SeeSawYellow)
                
                Rectangle()
                    .cornerRadius(90, corners: .allCorners)
                    .frame(height: 46)
                    .foregroundColor(.SeeSawBlue)
                
                Rectangle()
                    .cornerRadius(90, corners: .allCorners)
                    .frame(height: 46)
                    .foregroundColor(.SeeSawRed)
            }
            
            Spacer()
            
            Button {
                isModalPresented = false
            } label: {
                CapsuleButtonView(color: .Gray400, text: "다시 선택할래요", size: .large)
            }
            
            Button {
                isModalPresented = false
            } label: {
                CapsuleButtonView(color: .Gray900, text: "저장할래요", size: .large)
            }
        }
        .padding(20)
        .background(Color.Gray200)
        .ignoresSafeArea()
    }
}
