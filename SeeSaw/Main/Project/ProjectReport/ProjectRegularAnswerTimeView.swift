//
//  ProjectRegularAnswerTimeView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectRegularAnswerTimeView: View {
    var regularAnswerTime: Int = 10
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("상시 회고를")
                .font(.system(size: 24))
                .fontWeight(.heavy)
                .foregroundColor(.Gray900)
                .padding(.bottom, 6)
            HStack {
                Text("\(regularAnswerTime)")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .foregroundColor(.SeeSawBlue)
                Text("번 남겼어요")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
            }
            Spacer()
        }
        .padding(24)
        .frame(height: 550)
        .background(Color.Gray100)
    }
}

struct ProjectRegularAnswerTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRegularAnswerTimeView()
    }
}
