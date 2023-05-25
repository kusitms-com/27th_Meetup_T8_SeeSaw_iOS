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
                            
                            ZStack(alignment: .topLeading) {
                                Rectangle()
                                    .frame(height: 180)
                                    .foregroundColor(.Gray100)
                                    .cornerRadius(12, corners: .allCorners)
                                
                                HStack(alignment: .top) {
                                    Text("Q\(index + 1)")
                                        .foregroundColor(.SeeSawBlue)
                                        .font(.ssWhiteBody1)
                                        .padding(.trailing, 4)
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(dataItem)
                                            .font(.ssWhiteBody1)
                                            .foregroundColor(.Gray900)
                                            .lineLimit(nil)
                                            .multilineTextAlignment(.leading)
                                            .padding(.bottom, 12)
                                        
                                        Text(finalAnswerArray[index])
                                            .font(.ssBlackBody1)
                                            .foregroundColor(.Gray500)
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 20)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 6)
                        }
                    }
                }
            }
        }
        .background(Color.Gray200)
    }
}
