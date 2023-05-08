//
//  ExplainValuesView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/05.
//

import SwiftUI

enum ValuesMessages {
    static let first = """
현재에 집중하다보면
때로는 삶의 중요한 가치를 놓치기도 하죠.

시소는 바쁜 일상 속에서도
중요한 가치를 잃지 않도록 도와줍니다.

"""
    static let second = """
이제 여러분에게
중요한 세 가지 가치를 설정합니다.

이 가치들과 관련된 실천 하나하나가
여러분의 삶에 필요한 에너지를
충전시켜줄 거예요.
"""
    static let third = """
또, 프로젝트를 기록하며
그 가치를 향해 잘 나아가고 있는지
점검할 수 있습니다.

그럼 이제 가치를 설정하러 가볼까요?

"""
}

struct ExplainValuesView: View {
    var body: some View {
        VStack {
            TabView {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Rectangle()
                        .frame(height: 300)
                        .padding(.bottom, 20)
                    
                    Text(ValuesMessages.first)
                    
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Rectangle()
                        .frame(height: 300)
                        .padding(.bottom, 20)
                        .foregroundColor(.SeeSawGreen)
                    
                    Text(ValuesMessages.second)
                    
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Rectangle()
                        .frame(height: 300)
                        .padding(.bottom, 20)
                    
                    Text(ValuesMessages.third)
                    
                    Spacer()
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            CapsuleButtonView(isActive: false,
                              text: "다음",
                              size: .large)
        }
        .padding(20)
    }
}

struct ExplainValuesView_Previews: PreviewProvider {
    static var previews: some View {
        ExplainValuesView()
    }
}
