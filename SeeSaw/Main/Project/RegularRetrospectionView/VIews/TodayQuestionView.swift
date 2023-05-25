//
//  TodayQuestionView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/20.
//

import SwiftUI

struct TodayQuestionView: View {
    @Binding var todayQuestion: String
    @StateObject var projectVM = ProjectViewModel()
    @Binding var questionId: Int?
    @Binding var isQuestion: Bool
    var body: some View {
        VStack {
            Button {
                isQuestion.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(isQuestion ? .SeeSawGreen : .white)
                        .opacity(isQuestion ? 0.2 : 1)
                        .frame(height: 100)
                    HStack(alignment: .top) {
                        Spacer()
                            .frame(width: 12)
                        if isQuestion {
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
                                .foregroundColor(isQuestion ? .Gray700 : .Gray400)
                            
                            Text(todayQuestion)
                                .font(.ssWhiteBody1)
                                .foregroundColor(isQuestion ? .Gray900 : .Gray400)
                                .multilineTextAlignment(.leading)
                        }
                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            projectVM.getTodayReviewQuestion { questionId, contents in
                self.questionId = questionId
                self.todayQuestion = contents
            }
        }
        .background(Color.Gray200)
    }
}
