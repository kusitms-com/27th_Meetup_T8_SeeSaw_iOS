//
//  ProjectPersonView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectPersonView: View {
    var userName: String = "에몽"
    var middleReview: String = "연구와 실험이 진행되는 프로세스에 대해 학습했다. 가설을 세우고, 실험을 하고, 데이터를 수집하고 분석하는 과정이 어떠한 프로세스로 이뤄지는지 학습할 수 있었다."
    var finalReview: String = "당연히 실험을 하고 프로젝트를 진행하는 법을 배웠다. 그리고 하나의 연구가 진행되기 위해서는 꽤 여러번 프로젝트의 주제가 바뀌고 엎어진다는 거을 깨닫게 되었다. 처음에 의도한 대로 흘러간 것은 거의 없는 것 같지만, 분명히 처음보다 나은 프로젝트 주제로 변화한 것은 확실하다."
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("프로젝트에서\(userName)님은\n이런 사람이었어요")
                .font(.system(size: 24))
                .fontWeight(.heavy)
                .foregroundColor(.Gray900)
                .lineSpacing(6)
            Spacer()
                .frame(height: 60)
            Text("중간 회고")
                .font(.ssWhiteBody2)
                .foregroundColor(.Gray400)
                .padding(.bottom, 8)
            Text(middleReview)
                .font(.ssBlackBody3)
                .foregroundColor(.Gray700)
            Spacer()
                .frame(height: 65)
            Text("마지막 회고")
                .font(.ssWhiteBody2)
                .foregroundColor(.Gray400)
                .padding(.bottom, 8)
            Text(finalReview)
                .font(.ssBlackBody3)
                .foregroundColor(.Gray700)
            Spacer()
        }
        .padding(24)
        .frame(height: 550)
        .background(Color.Gray100)
    }
}

struct ProjectPersonView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectPersonView()
    }
}
