//
//  ExplainValuesView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/05.
//

import SwiftUI

enum ValuesMessages {
    static let first = """
현재에 집중하다 보면
중요한 가치를 놓치기도 하죠.

시소는 바쁜 일상 속에서도
나만의 가치를 잃지 않도록 도와줘요.
"""
    static let secondFront = """
중요한 3가지 가치를 설정해요.
시소는 가치를 향한
"""
    static let secondBack = """
님의 여정을 함께해요!

일상에서 가치를 실천하면
삶에 필요한 에너지가 충전돼요.
"""
    static let third = """
프로젝트를 회고하며
가치를 향해 잘 나아가고 있는지
점검할 수 있어요.

그럼 가치를 설정하러 가볼까요?
"""
}

struct ExplainValuesView: View {
    @AppStorage("nickname") var nickname = ""
    @State private var selectedView = 1
    
    var body: some View {
        VStack {
            skipButton
            
            TabView(selection: $selectedView) {
                ExplainValue(text: ValuesMessages.first,
                             color: .SeeSawGreen,
                             imageName: "ValueExplainFirst")
                    .tag(1)
                
                ExplainValue(text: "\(ValuesMessages.secondFront) \(nickname)\(ValuesMessages.secondBack)",
                             color: .SeeSawBlue,
                             imageName: "ValueExplainSecond")
                    .tag(2)
                
                ExplainValue(text: ValuesMessages.third,
                             color: .SeeSawGreen,
                             imageName: "ValueExplainThird")
                    .tag(3)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            NavigationLink {
                SelectValuesView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                CapsuleButtonView(color: Color.SeeSawGreen,
                                  text: "가치 설정하기",
                                  size: .large)
                .opacity(selectedView != 3 ? 0.0 : 1.0)
            }
            .disabled(selectedView != 3)
        }
        .padding(20)
    }
    
    var skipButton: some View {
        HStack {
            Spacer()
            
            Button {
                selectedView = 3
            } label: {
                HStack {
                    Text("건너뛰기")
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.Gray400)
                .opacity(selectedView != 3 ? 1.0 : 0.0)
            }
            .disabled(selectedView == 3)
        }
    }
}

struct ExplainValue: View {
    let text: String
    let color: Color
    let imageName: String
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            HStack {
                Text(text)
                Spacer()
            }
            
            GifImage(imageName)
                .frame(height: 440)
            
            Spacer()
        }
    }
}

struct ExplainValuesView_Previews: PreviewProvider {
    static var previews: some View {
        ExplainValuesView()
    }
}
