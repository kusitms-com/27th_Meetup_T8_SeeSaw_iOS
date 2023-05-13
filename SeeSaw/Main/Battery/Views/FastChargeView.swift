//
//  FastChargeView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/13.
//

import SwiftUI

enum FastChargeDescription {
    static let title = """
삶의 균형을 위해
오늘은 어떤 걸 하셨나요?
입력하면 배터리 충전이 진행됩니다
"""
    static let question = "무슨 고속충전이었나요?"
    static let placeholder = "오늘의 고속충전을 적어주세요"
    static let exampleLabel = "예시로는 이런 것들이 있어요!"
    static let example = """
운동하기, 산책하기, 책 읽기, 영화 보기, 명상하기,
가족과 시간 보내기, 친구와 연락하기
"""
}

struct FastChargeView: View {
    @State private var todayFastCharge = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text(FastChargeDescription.title)
                    .font(.ssHeading2)
                
                Divider()
                    .padding(.vertical, 28)
                
                Text(FastChargeDescription.question)
                    .font(.ssBlackSubTitle)
                    .padding(.bottom, 12)
                
                VStack(spacing: 0) {
                    HStack {
                        TextField("wow",
                                  text: $todayFastCharge,
                                  prompt: Text(FastChargeDescription.placeholder))
                        .font(.ssBlackBody1)
                        
                        Text("0/20")
                            .font(.ssBlackBody3)
                            .foregroundColor(.Gray600)
                    }
                    .padding(.bottom, 8)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.Gray900)
                }
                .padding(.bottom, 16)
                
                Text(FastChargeDescription.exampleLabel)
                    .font(.ssBlackBody2)
                    .foregroundColor(.Gray600)
                Text(FastChargeDescription.example)
                    .font(.ssBlackBody2)
                    .foregroundColor(.Gray400)
                    .padding(.bottom, 48)
                
                Text("어떤 가치를 위한 것이었나요?")
                    .padding(.bottom, 16)
                
                HStack(spacing: 8) {
                    ZStack {
                        Rectangle()
                            .cornerRadius(12, corners: .allCorners)
                            .frame(height: 48)
                            .foregroundColor(.Gray300)
                        Text("도전")
                            .font(.ssBlackBody1)
                            .foregroundColor(.Gray700)
                    }
                    ZStack {
                        Rectangle()
                            .cornerRadius(12, corners: .allCorners)
                            .frame(height: 48)
                            .foregroundColor(.Gray300)
                        Text("사랑")
                            .font(.ssBlackBody1)
                            .foregroundColor(.Gray700)
                    }
                    ZStack {
                        Rectangle()
                            .cornerRadius(12, corners: .allCorners)
                            .frame(height: 48)
                            .foregroundColor(.Gray300)
                        Text("여유")
                            .font(.ssBlackBody1)
                            .foregroundColor(.Gray700)
                    }
                }
                .padding(.bottom, 40)
                
                Button {
                    
                } label: {
                    CapsuleButtonView(color: .Gray900,
                                      text: "고속충전하기",
                                      size: .large)
                }
            }
        }
        .navigationTitle("고속충전")
        .navigationBarTitleDisplayMode(.inline)
        .padding(20)
        .background(Color.Gray200)
    }
}

struct FastChargeView_Previews: PreviewProvider {
    static var previews: some View {
        FastChargeView()
    }
}
