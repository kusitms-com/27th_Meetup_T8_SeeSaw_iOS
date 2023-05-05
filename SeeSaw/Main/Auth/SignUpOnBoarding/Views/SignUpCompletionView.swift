//
//  SignUpCompletionView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct SignUpCompletionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Text("회원가입 완료!\n시소와 함께 균형을 찾아가볼까요?")
                .font(.ssHeading2)
            Rectangle()
                .frame(height: 400)
            
            Spacer()
            
            NavigationLink {
                ExplainValuesView().navigationBarBackButtonHidden(true)
            } label: {
                HStack {
                    Spacer()
                    Text("시작하기")
                    Spacer()
                }
                .font(.ssWhiteBody1)
                .foregroundColor(.Gray100)
                .frame(height: 44)
                .background(Color.SeeSawGreen)
                .clipShape(Capsule())
            }
        }
        .padding(20)
    }
}

struct SignUpCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCompletionView()
    }
}
