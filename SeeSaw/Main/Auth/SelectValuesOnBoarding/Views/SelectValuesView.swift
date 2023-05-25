//
//  SelectValuesView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/16.
//

import SwiftUI
// import UIKit

struct SelectValuesView: View {
    @AppStorage("nickname") var nickname: String = ""
    @State var values = ["도전", "여유", "용기", "배려", "따뜻함",
                         "열정", "성장", "소통", "신뢰", "유연함",
                         "끈기", "배움", "행복", "공유", "즐거움",
                         "사랑", "성실", "정의", "조화", "감사",
                         "자유", "긍정", "성취", "명예", "지혜"]
    let columns = [
        GridItem(.adaptive(minimum: 40), spacing: 0, alignment: .leading),
        GridItem(.adaptive(minimum: 40), spacing: 0, alignment: .leading),
        GridItem(.adaptive(minimum: 40), spacing: 0, alignment: .leading),
        GridItem(.adaptive(minimum: 40), spacing: 0, alignment: .leading),
        GridItem(.adaptive(minimum: 40), spacing: 0, alignment: .leading)
        ]
    @State private var selectedValues: [String] = []
    @State private var isModalPresented = false
    let selectedValueColors: [Color] = [.Gray300, .SeeSawYellow, .SeeSawBlue, .SeeSawRed]
    @State private var isAnimating: Bool = false
    @State private var newValue = ""
    @State private var showNewValue = false
    
    @State private var isPostValues = false
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationLink(destination: SeeSawTabView().navigationBarBackButtonHidden(true),
                           isActive: $isPostValues,
                           label: {})
            
            VStack(spacing: 16) {
                askValue
                showSelecteValueRow
            }
            .padding(.vertical, 30)
            
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                
                Text("내년 1월 1일 전까지 수정할 수 없어요. 신중하게 고민해볼까요?")
                    .font(.ssBlackBody2)
                    .foregroundColor(.Gray500)
                    .padding(.vertical, 20)
                
                addMyValue
                .padding(.bottom)
                
                LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
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
            SaveValuesSheetView(isModalPresented: $isModalPresented,
                                values: $selectedValues,
                                isPostValues: $isPostValues)
        } onEnd: {
            print("set value halfSheet dismiss")
        }
        .onAppear(perform: { isAnimating = true })
    }
    
    var askValue: some View {
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
    }
    
    var showSelecteValueRow: some View {
        HStack {
            Spacer()
            ZStack(alignment: .leading) {
                Rectangle()
                    .cornerRadius(90, corners: [.topLeft, .bottomLeft])
                    .frame(width: 360, height: 92)
                    .foregroundColor(.GrayWhite)
                VStack(alignment: .leading) {
                    if selectedValues.isEmpty {
                        HStack {
                            Text(".")
                                .opacity(isAnimating ? 1 : 0)
                                .animation(.easeInOut(duration: 1.5).repeatForever(), value: isAnimating)
                            Text(".")
                                .opacity(isAnimating ? 1 : 0)
                                .animation(.easeInOut(duration: 1.0).delay(0.5).repeatForever(), value: isAnimating)
                            Text(".")
                                .opacity(isAnimating ? 1 : 0)
                                .animation(.easeInOut(duration: 0.5).delay(1.0).repeatForever(), value: isAnimating)
                        }
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
                        }
                    }
                }
                .foregroundColor(.GrayBlack)
                .font(.ssBlackTitle1)
                .padding(.leading, 40)
            }
        }
    }
    
    var addMyValue: some View {
        HStack(alignment: .top) {
            if showNewValue == false {
                Button {
                    showNewValue = true
                } label: {
                    HStack(spacing: 2) {
                        Image(systemName: "plus")
                        Text("직접 입력")
                            .font(.ssWhiteBody1)
                    }
                    .foregroundColor(.Gray700)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(
                        Rectangle()
                            .cornerRadius(100, corners: .allCorners)
                            .foregroundColor(.Gray100)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.Gray700, lineWidth: 1)
                    )
                }
            } else {
                VStack(alignment: .leading, spacing: 6) {
                    TextField("나만의 가치를 알려주세요!", text: $newValue)
                        .font(.ssBlackBody1)
                        .padding(.vertical, 6)
                        .padding(.leading)
                        .textInputAutocapitalization(.never)
                        .background(
                            Rectangle()
                                .cornerRadius(100, corners: .allCorners)
                                .foregroundColor(.Gray100)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.Gray700, lineWidth: 1)
                        )
                        .onChange(of: newValue, perform: {
                            newValue = String($0.prefix(6))
                        })
                    Text("가치는 6글자까지 입력할 수 있어요!")
                        .font(.ssWhiteBody3)
                        .foregroundColor(.SeeSawRed)
                        .padding(.leading)
                }
                
                Button {
                    if newValue.isEmpty == false {
                        showNewValue = false
                        values.append(newValue)
                        newValue = ""
                    }
                } label: {
                    Text("추가하기")
                        .font(.ssWhiteBody1)
                        .foregroundColor(.Gray700)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(
                            Rectangle()
                                .cornerRadius(100, corners: .allCorners)
                                .foregroundColor(.Gray100)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.Gray700, lineWidth: 1)
                        )
                }
            }
        }
    }
}

struct SelectValuesView_Previews: PreviewProvider {
    static var previews: some View {
        SelectValuesView()
    }
}
