//
//  ProjectRetrospectionView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/18.
//

import SwiftUI

struct ProjectRetrospectionView: View {
    @State var emojiNum: [Int] = [0, 0, 0, 0, 0]
    @State var isMiddle: Bool = false
    var isFinal: Bool = false
    var isProjectReport: Bool = false
    var emojiList: [String] = ["😍", "😎", "🤔", "😡", "🥺"]
    let numbers = 0...4
    var body: some View {
        VStack(alignment: .leading) {
            Text("프로젝트에서 느낀 감정을 자유롭게 눌러주세요")
            HStack(spacing: 24) {
                ForEach(numbers, id: \.self) { number in
                    VStack {
                        Button {
                            emojiNum[number] += 1
                        } label: {
                            Text(emojiList[number])
                                .font(.system(size: 40))
                        }
                        Text("\(emojiNum[number])")
                            .font(.ssWhiteBody3)
                            .foregroundColor(.Gray700)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.horizontal, 35)
            VStack {
                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 70)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.SeeSawYellow)
                        .overlay(
                            Text("상시 회고")
                                .font(.ssBlackTitle2)
                                .foregroundColor(.Gray900)
                        )
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.SeeSawYellow.opacity(isMiddle ? 1 : 0.6))
                        .overlay(
                            VStack {
                                Text("중간 회고")
                                    .font(.ssBlackTitle2)
                                    .foregroundColor(.Gray700)
                                if !isMiddle {
                                    Text("열려요")
                                        .font(.ssBlackBody3)
                                        .foregroundColor(.Gray700)
                                }
                            }
                        )
                }
                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.SeeSawYellow.opacity(isFinal ? 1 : 0.6))
                        .overlay(
                            VStack {
                                Text("마지막 회고")
                                    .font(.ssBlackTitle2)
                                    .foregroundColor(.Gray700)
                                if !isFinal {
                                    Text("열려요")
                                        .font(.ssBlackBody3)
                                        .foregroundColor(.Gray700)
                                }
                            }
                        )
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.white)
                        .overlay(
                            VStack {
                                Text("프로젝트")
                                    .font(.ssBlackTitle2)
                                    .foregroundColor(.Gray500)
                                Text("리포트")
                                    .font(.ssBlackTitle2)
                                    .foregroundColor(.Gray500)
                            }
                        )
                    
                }
            }
        }
    }
}

struct ProjectRetrospectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRetrospectionView()
    }
}
