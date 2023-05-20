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
            Text("회원가입 완료!\n시소와 함께\n균형을 찾으러 가볼까요?")
                .font(.ssHeading2)
                .padding(.top, 60)
            
            HStack {
                Spacer()
                GifImage("SignUpCompletion")
                    .frame(height: 360)
                Spacer()
            }
            
            Spacer()
            
            NavigationLink {
                ExplainValuesView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                CapsuleButtonView(color: .SeeSawGreen,
                                  text: "시작하기",
                                  size: .large)
            }
        }
        .padding(20)
        .background(Color.Gray200)
    }
}

struct SignUpCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCompletionView()
    }
}
