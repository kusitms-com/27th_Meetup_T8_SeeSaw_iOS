//
//  FinalReviewMainView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct FinalReviewMainView: View {
    @AppStorage("nickname") var nickname: String = ""
    var projectTitle: String
    @Environment(\.presentationMode) var presentationMode
    @State var finalQuestionArray: [String] = ["", "", "", "", "", "", "", ""]
    @State var finalAnswerArray: [String] = ["", "", "", "", "", "", "", ""]
    @State var isFull: Bool = false
    @State var isFullQuestion: [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
    @State var questionArray: [QnaQuestion] = []
    @StateObject var middleFinalReviewVM = MiddleFinalReviewViewModel()
    var rememberanceId: Int = 0
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
            FinalReviewQuestionView(isFull: $isFull, finalQuestionArray: finalQuestionArray, finalAnswerArray: finalAnswerArray, questionArray: questionArray, isFullQuestion: $isFullQuestion)
                .frame(width: UIScreen.main.bounds.width)
                .padding(20)
                .background(Color.Gray200)
        }
    }
}

struct FinalReviewMainView_Previews: PreviewProvider {
    static var previews: some View {
        FinalReviewMainView(nickname: "에몽", projectTitle: "큐시즘 밋업데이")
    }
}
