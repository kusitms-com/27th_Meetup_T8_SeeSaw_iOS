//
//  InterimReviewQuestionView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/20.
//

import SwiftUI

struct InterimReviewQuestionView: View {
    var userName: String = "에몽"
    var projectTitle: String = "KUSITMS"
    var interimQuestionArray: [String] = ["프로젝트를 진행하면서 배운 점은 무엇인가요?", "프로젝트를 진행하면서 아쉬웠던 점은 무엇이며, 어떻게 나아가고 싶은가요?", "에몽님은 현재까지 놀라운 감정을 가장 많이 느끼셨어요. 그 이유는 무엇일까요?", "에몽님의 KUSITMS 목표와 가치는 다음과 같습니다. 이에 얼마나 다가갔나요?", "프로젝트 안에서 에몽님은 어떤 사람이었나요?", "에몽님은 KUSITMS 프로젝트를 통해 어떤 사람으로 성장하고 싶으신가요?"]
    @State var interimAnswerArray: [String] = ["", "", "", "", "", "", ""]
    var body: some View {
        VStack {
            ScrollView {
                ForEach(Array(interimQuestionArray.enumerated()), id: \.element) { index, dataItem in
                    NavigationLink(destination: WriteInterimReviewView( questionNum: index + 1, questionTitle: dataItem, interimAnswerArray: self.$interimAnswerArray)) {
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
                                        .multilineTextAlignment(.leading)
                                }
                                Text(interimAnswerArray[index])
                                    .frame(height: 100)
                            }
                        }
                        .frame(width: 350, height: 180)
                    }
                }
            }
        }
    }
}

struct InterimReviewQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        InterimReviewQuestionView()
    }
}
