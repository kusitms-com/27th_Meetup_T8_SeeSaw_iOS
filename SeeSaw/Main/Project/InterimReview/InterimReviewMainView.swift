//
//  InterimReviewQuestionView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/20.
//

import SwiftUI

struct InterimReviewMainView: View {
    @AppStorage("nickname") var nickname: String = ""
    var projectTitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                Text(
                    "\(nickname)님의")
                .font(.ssHeading2)
                .foregroundColor(.Gray700)
                Text(projectTitle)
                    .font(.ssHeading2)
                    .foregroundColor(.SeeSawBlue)
                Text("중간 회고록")
                    .font(.ssHeading2)
                    .foregroundColor(.Gray700)
                Spacer()
                    .frame(height: 30)
            }
            .padding(.leading, 40)
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width, height: 1)
                .foregroundColor(.Gray300)
            InterimReviewQuestionView()
                .frame(width: UIScreen.main.bounds.width)
                .padding(20)
                .background(Color.Gray200)
        }
    }
}

struct InterimReviewMainView_Previews: PreviewProvider {
    static var previews: some View {
        InterimReviewMainView(nickname: "에몽", projectTitle: "큐시즘 밋업데이")
    }
}
