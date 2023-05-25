//
//  ProjectAnswerTimeView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectTodayAnswerTimeView: View {
    var answerTime: Int = 7
    var body: some View {
        VStack(alignment: .leading) {
            Text("오늘의 회고 질문에")
                .font(.system(size: 24))
                .fontWeight(.heavy)
                .foregroundColor(.Gray900)
                .padding(.bottom, 1)
            HStack(spacing: 0) {
                Text("총 ")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
                Text("\(answerTime)")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .foregroundColor(.SeeSawBlue)
                Text("번 답하셨어요")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
            }
            Image("QuestionImage")
            Spacer()
        }
        .padding(24)
        .frame(height: 550)
        .background(Color.Gray100)
    }
}

struct ProjectTodayAnswerTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectTodayAnswerTimeView()
    }
}
