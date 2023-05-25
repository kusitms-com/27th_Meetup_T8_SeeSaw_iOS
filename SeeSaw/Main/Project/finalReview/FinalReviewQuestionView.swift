//
//  FinalReviewQuestionVIew.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct FinalReviewQuestionView: View {
    @AppStorage("nickname") var nickname: String = ""
    @Binding var isFull: Bool
    var projectTitle: String = "KUSITMS"
    @State var finalQuestionArray: [String] = ["", "", "", "", "", "", "", ""]
    @State var finalAnswerArray: [String] = ["", "", "", "", "", "", "", ""]
    var questionArray: [QnaQuestion] = []
    @Binding var isFullQuestion: [Int]
    var body: some View {
        VStack {
            ScrollView {
                ForEach(Array(finalQuestionArray.enumerated()), id: \.element) { index, dataItem in
                    if !questionArray.isEmpty {
                        NavigationLink(destination: WriteFinalReviewView( questionNum: index + 1, questionTitle: dataItem, finalAnswerArray: self.$finalAnswerArray, isFullQuestion: $isFullQuestion, isFull: $isFull, disabledButton: !(finalAnswerArray[index] == ""), qnaId: questionArray[index].qnaId)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(.white)
                                VStack(alignment: .leading) {
                                    HStack(alignment: .top) {
                                        Text("Q\(index + 1)")
                                            .foregroundColor(.SeeSawBlue)
                                            .font(.ssWhiteBody1)
                                        Text(dataItem)
                                            .font(.system(size: 16))
                                            .fontWeight(.heavy)
                                            .foregroundColor(.Gray900)
                                            .lineLimit(nil)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                    }
                                    .padding(.horizontal, 4)
                                    Text(finalAnswerArray[index])
                                        .frame(height: 100)
                                    Spacer()
                                }
                                .padding(8)
                            }
                            .frame(width: 350, height: 180)
                        }
                    }
                }
            }
        }
        .background(Color.Gray200)
    }
}
