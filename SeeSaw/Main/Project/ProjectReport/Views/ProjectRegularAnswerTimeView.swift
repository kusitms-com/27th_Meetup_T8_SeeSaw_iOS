//
//  ProjectRegularAnswerTimeView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectRegularAnswerTimeView: View {
    var regularAnswerTime: Int = 10
    var date1: String
    var answer1: String
    var date2: String
    var answer2: String
    var date3: String
    var answer3: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("상시 회고를")
                .font(.system(size: 24))
                .fontWeight(.heavy)
                .foregroundColor(.Gray900)
                .padding(.bottom, 6)
            HStack {
                Text("\(regularAnswerTime)")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .foregroundColor(.SeeSawBlue)
                Text("번 남겼어요")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
            }
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    Text(date1)
                        .font(.ssWhiteBody2)
                        .foregroundColor(.Gray400)
                    Text(answer1)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(.Gray700)
                }
                Image("PurpleRectangle1")
            }
            Spacer()
                .frame(height: 20)
            ZStack(alignment: .topTrailing) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(date2)
                            .font(.ssWhiteBody2)
                            .foregroundColor(.Gray400)
                        Text(answer2)
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .foregroundColor(.Gray700)
                    }
                    Spacer()
                }
                Image("PurpleRectangle2")
            }
            .frame(width: 300)
            
            Spacer()
                .frame(height: 20)
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    Text(date3)
                        .font(.ssWhiteBody2)
                        .foregroundColor(.Gray400)
                    Text(answer3)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(.Gray700)
                }
                Image("PurpleRectangle3")
            }
        }
        .padding(24)
        .frame(width: 300, height: 550)
        .background(Color.Gray100)
    }
}

