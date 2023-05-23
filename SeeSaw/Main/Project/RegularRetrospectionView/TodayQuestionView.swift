//
//  TodayQuestionView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/20.
//

import SwiftUI

struct TodayQuestionView: View {
    var todayQuestion: String = "팀원들과의 협업은 잘 진행되고 있는 것 같나요?"
    @State var isClickRegularButton: Bool = false
    var body: some View {
        VStack {
            Button {
                isClickRegularButton.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(isClickRegularButton ? .SeeSawGreen : .white)
                        .opacity(isClickRegularButton ? 0.2 : 1)
                        .frame(height: 100)
                    HStack(alignment: .top) {
                        Spacer()
                            .frame(width: 12)
                        if isClickRegularButton {
                            Image("isCheckRegularButton")
                                .frame(width: 24, height: 24)
                        } else {
                            Image(systemName: "checkmark.square")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        VStack(alignment: .leading) {
                            Text("오늘의 회고 질문")
                                .font(.ssBlackBody1)
                                .foregroundColor(isClickRegularButton ? .Gray700 : .Gray400)
                            Text(todayQuestion)
                                .font(.ssWhiteBody1)
                                .foregroundColor(isClickRegularButton ? .Gray900 : .Gray400)
                                .frame(width: 200)
                                .multilineTextAlignment(.leading)
                        }
                        Spacer()
                    }
                }
            }
        }
        .background(Color.Gray200)
    }
}

struct TodayQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        TodayQuestionView()
    }
}
