//
//  FinalReviewMainView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct FinalReviewMainView: View {
    var userName: String 
    var projectTitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                Text(
                    "\(userName)님의")
                .font(.ssHeading2)
                .foregroundColor(.Gray700)
                Text(projectTitle)
                    .font(.ssHeading2)
                    .foregroundColor(.SeeSawBlue)
                Text("마무리 회고록")
                    .font(.ssHeading2)
                    .foregroundColor(.Gray700)
                Spacer()
                    .frame(height: 30)
            }
            .padding(.leading, 40)
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width, height: 1)
                .foregroundColor(.Gray300)
            FinalReviewQuestionView()
                .frame(width: UIScreen.main.bounds.width)
                .padding(20)
                .background(Color.Gray200)
        }
        .padding(20)
    }
}

struct FinalReviewMainView_Previews: PreviewProvider {
    static var previews: some View {
        FinalReviewMainView(userName: "에몽", projectTitle: "큐시즘 밋업데이")
    }
}
