//
//  WriteInterimReviewView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/20.
//

import SwiftUI

struct WriteInterimReviewView: View {
    @Environment(\.presentationMode) var presentationMode
    var questionNum: Int
    var questionTitle: String
    @Binding var interimAnswerArray: [String]
    @State var answerText: String = ""
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
                    interimAnswerArray[questionNum - 1] = answerText
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    CapsuleButtonView(color: (answerText.count == 0 ? .Gray400 : .SeeSawGreen), text: "답변 저장", size: .large)
                        .frame(width: 350)
                }
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
            answerText = interimAnswerArray[questionNum - 1]
        }
    }
}

struct WriteInterimReviewView_Previews: PreviewProvider {
    static var previews: some View {
        WriteInterimReviewView(questionNum: 1, questionTitle: "안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요", interimAnswerArray: .constant(["", "", "", "", "", "", ""]))
    }
}
