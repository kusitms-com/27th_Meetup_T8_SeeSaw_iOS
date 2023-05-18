//
//  SelectValuesView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/16.
//

import SwiftUI
// import UIKit

struct SelectValuesView: View {
    @State private var nickname = "에몽"
    let values = ["도전", "여유", "희망", "공손", "긍정",
                  "기쁨", "모험", "도덕", "배려", "성실",
                  "신뢰", "열정", "유능", "유연", "예의",
                  "사랑", "재미", "조화", "정직", "즐거움",
                  "침착", "평화", "행복"]
    let columns = [
        GridItem(.flexible(), spacing: 0, alignment: .leading),
        GridItem(.flexible(), spacing: 0, alignment: .leading),
        GridItem(.flexible(), spacing: 0, alignment: .leading),
        GridItem(.flexible(), spacing: 0, alignment: .leading),
        GridItem(.flexible(), spacing: 0, alignment: .leading)
        ]
    @State private var selectedValues: [String] = []
    @State private var isModalPresented = false
    let selectedValueColors: [Color] = [.Gray300, .SeeSawYellow, .SeeSawBlue, .SeeSawRed]
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 16) {
                HStack {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .cornerRadius(90, corners: [.topRight, .bottomRight])
                            .frame(width: 360, height: 92)
                            .foregroundColor(.GrayWhite)
                        VStack(alignment: .leading) {
                            Text("\(nickname)님에게 중요한")
                                .foregroundColor(.GrayBlack)
                            HStack(spacing: 0) {
                                Text("올해의 가치 3가지")
                                    .foregroundColor(.SeeSawGreen)
                                Text("는 무엇인가요?")
                                    .foregroundColor(.GrayBlack)
                            }
                        }
                        .font(.ssBlackTitle1)
                        .padding(.leading, 20)
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .cornerRadius(90, corners: [.topLeft, .bottomLeft])
                            .frame(width: 360, height: 92)
                            .foregroundColor(.GrayWhite)
                        VStack(alignment: .leading) {
                            if selectedValues.isEmpty {
                                Text(".  .  .")
                            } else {
                                HStack(spacing: 0) {
                                    ForEach(selectedValues, id: \.self) { value in
                                        if let index = selectedValues.firstIndex(of: value) {
                                            if index > 0 {
                                                Text(" · ")
                                            }
                                        }
                                        Text("\(value)")
                                    }
                                    Text("에 가치를 두는")
                                }
                                Text("한 해를 보내고 싶어요")
                            }
                        }
                        .foregroundColor(.GrayBlack)
                        .font(.ssBlackTitle1)
                        .padding(.leading, 40)
                    }
                }
            }
            .padding(.vertical, 30)
            
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                
                Text("내년 1월 1일 전까지 수정할 수 없어요. 신중하게 고민해볼까요?")
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray500)
                    .padding(.vertical, 20)
                
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(values, id: \.self) { value in
                        Button {
                            if let index = selectedValues.firstIndex(of: value) {
                                selectedValues.remove(at: index)
                            } else {
                                selectedValues.append(value)
                            }
                        } label: {
                            Text(value)
                                .font(selectedValues.contains(value) ? .ssWhiteBody1 : .ssBlackBody1)
                                .foregroundColor(selectedValues.contains(value) ? .Gray100 : .Gray700)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(
                                    Rectangle()
                                        .cornerRadius(100, corners: .allCorners)
                                        .foregroundColor(selectedValueColors[(selectedValues.firstIndex(of: value) ?? -1) + 1])
                                )
                        }
                        .disabled(!selectedValues.contains(value) && selectedValues.count == 3)
                    }
                }
                
                Spacer()
                
                Button {
                    isModalPresented = true
                } label: {
                    CapsuleButtonView(color: selectedValues.count != 3 ? .Gray400 : .Gray900,
                                      text: "가치 저장하기",
                                      size: .large)
                }
                .disabled(selectedValues.count != 3)
            }
            .padding([.horizontal, .bottom], 20)
        }
        .background(Color.Gray200)
        .halfSheet(showSheet: $isModalPresented) {
            SaveValuesSheetView(isModalPresented: $isModalPresented, values: $selectedValues)
        } onEnd: {
            print("onend")
        }
    }
}

struct SelectValuesView_Previews: PreviewProvider {
    static var previews: some View {
        SelectValuesView()
    }
}
