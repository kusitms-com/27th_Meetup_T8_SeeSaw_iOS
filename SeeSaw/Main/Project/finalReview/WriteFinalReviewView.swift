//
//  WriteFinalReviewView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct WriteFinalReviewView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var middleFinalReviewVM = MiddleFinalReviewViewModel()
    var questionNum: Int
    var questionTitle: String
    @Binding var finalAnswerArray: [String]
    @Binding var isFullQuestion: [Int]
    @Binding var isFull: Bool
    @State var answerText: String = ""
    var disabledButton: Bool = true
    var qnaId: Int = 0
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Q\(questionNum)")
                    .foregroundColor(.SeeSawBlue)
                    .font(.ssWhiteBody1)
                Text(questionTitle)
                    .font(.system(size: 16))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
            }
            Spacer()
                .frame(height: 60)
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(.Gray300)
            VStack {
                TextEditor(text: $answerText)
                    .padding(10)
                    .onChange(of: answerText) { newValue in
                        if newValue.count > 500 {
                            answerText = String(newValue.prefix(500))
                        }
                    }
                    .frame(width: 350, height: 400)
                    .background(Color.white)
                    .cornerRadius(12)
                Spacer()
                    .frame(height: 38)
                Button {
                    finalAnswerArray[questionNum - 1] = answerText
                    isFullQuestion[questionNum - 1] = 1
                    if isFullQuestion[0] == 1 && isFullQuestion[1] == 1 && isFullQuestion[2] == 1 && isFullQuestion[3] == 1 && isFullQuestion[4] == 1 && isFullQuestion[5] == 1 && isFullQuestion[6] == 0 && isFullQuestion[7] == 1{
                        isFull = true
                    }
                    middleFinalReviewVM.postRemeberanceAnswer(projectQnaId: qnaId, answerContent: answerText) { response in
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    CapsuleButtonView(color: ((answerText.count == 0 || disabledButton) ? .Gray400 : .SeeSawGreen), text: "답변 저장", size: .large)
                        .frame(width: 350)
                }
                .disabled(answerText.count == 0 || disabledButton)
            }
            .padding(20)
            .background(Color.Gray200)
        }
        .padding(20)
        .frame(height: UIScreen.main.bounds.height)
        .background(Color.Gray100)
        .navigationBarTitle("중간 회고", displayMode: .inline)
        .foregroundColor(.Gray500)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
        )
        .onAppear {
            answerText = finalAnswerArray[questionNum - 1]
        }
    }
}
