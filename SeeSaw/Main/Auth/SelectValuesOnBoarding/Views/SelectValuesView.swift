//
//  SelectValuesView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/16.
//

import SwiftUI

struct SelectValuesView: View {
    @State private var nickname = "에몽"
    let values = ["도전", "여유", "희망", "공손", "긍정",
                  "기쁨", "모험", "도덕", "배려", "성실",
                  "신뢰", "열정", "유능", "유연", "예의",
                  "사랑", "재미", "조화", "정직", "즐거움",
                  "침착", "평화", "행복"]
    let columns = [
            GridItem(.flexible(), spacing: nil, alignment: nil),
            GridItem(.flexible(), spacing: nil, alignment: nil),
            GridItem(.flexible(), spacing: nil, alignment: nil),
            GridItem(.flexible(), spacing: nil, alignment: nil)
        ]
    @State private var selectedValues: [String] = []
    
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
                    Rectangle()
                        .cornerRadius(90, corners: [.topLeft, .bottomLeft])
                        .frame(width: 360, height: 92)
                        .foregroundColor(.GrayWhite)
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
                                        .foregroundColor(selectedValues.contains(value) ? .SeeSawGreen : .Gray300)
                                )
                        }
                        .disabled(!selectedValues.contains(value) && selectedValues.count == 3)
                    }
                }
                
//                Button {
//
//                } label: {
//                    Text("직접 입력")
//                        .foregroundColor(.Gray700)
//                        .padding(.vertical, 6)
//                        .padding(.horizontal, 12)
//                        .background(
//                            Rectangle()
//                                .cornerRadius(100, corners: .allCorners)
//                                .foregroundColor(.Gray300)
//                        )
//                }
                
                Spacer()
            }
            .padding([.horizontal, .bottom], 20)
        }
        .background(Color.Gray200)
    }
}

struct SelectValuesView_Previews: PreviewProvider {
    static var previews: some View {
        SelectValuesView()
    }
}
