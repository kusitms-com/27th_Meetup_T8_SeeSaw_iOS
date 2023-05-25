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
    @Environment(\.presentationMode) var presentationMode
    @State var interimQuestionArray: [String] = ["", "", "", "", "", ""]
    @State var interimAnswerArray: [String] = ["", "", "", "", "", ""]
    @State var isFull: Bool = false
    @State var isFullQuestion: [Int] = [0, 0, 0, 0, 0, 0]
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
            InterimReviewQuestionView(isFull: $isFull, interimQuestionArray: interimQuestionArray, interimAnswerArray: interimAnswerArray, questionArray: questionArray, isFullQuestion: $isFullQuestion)
                .frame(width: UIScreen.main.bounds.width)
                .padding(20)
                .background(Color.Gray200)
        }
        .navigationBarItems(trailing:
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("회고 완료")
                    .foregroundColor(.SeeSawGreen)
            }
            .disabled(!isFull)
        )
    }
}
