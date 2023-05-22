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
    var emojiList: [String] = ["LIKE", "NICE", "IDK", "ANGRY", "SAD"]
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
                            Image(emojiList[number])
                        }
                        Text("\(emojiNum[number])")
                            .font(.ssWhiteBody3)
                            .foregroundColor(.Gray700)
                    }
                }
            }
            .padding(.horizontal, 20)
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    NavigationLink(destination: ProjectRegularRetrospectionView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 70)
                                .frame(width: 180, height: 180)
                                .foregroundColor(.SeeSawYellow)
                                .overlay(
                                    Text("상시 회고")
                                        .font(.ssBlackTitle2)
                                        .foregroundColor(.Gray900)
                                )
                            ArrowUpRightView()
                                .offset(x: 40, y: -40)
                        }
                    }
                    ZStack {
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
                        if isMiddle {
                            NavigationLink(destination: InterimReviewView()) {
                                EmptyView()
                            }
                            .frame(width: 180, height: 180)
                            ArrowUpRightView()
                                .offset(x: 40, y: -40)
                        }
                    }
                }
                HStack(spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
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
                        if isFinal {
                            NavigationLink(destination: InterimReviewView()) {
                                ArrowUpRightView()
                                    .offset(x: 40, y: -40)
                            }
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 180, height: 180)
                            .foregroundColor(isProjectReport ? .SeeSawGreen : .Gray100)
                            .overlay(
                                VStack {
                                    if !isProjectReport {
                                        Image("FinalBubbleImage")
                                        Text("프로젝트\n리포트")
                                            .font(.ssBlackTitle2)
                                            .foregroundColor(.Gray500)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                            .frame(height: 40)
                                    } else {
                                        HStack {
                                            Image("OpenBubbleImage")
                                                .padding(7)
                                            Spacer()
                                        }
                                        Spacer()
                                            .frame(height: 23)
                                        Text("프로젝트\n리포트")
                                            .font(.ssBlackTitle2)
                                            .foregroundColor(.Gray500)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }
                                }
                            )
                        if isProjectReport {
                            NavigationLink(destination: ProjectReportView()) {
                                ArrowUpRightView()
                                    .offset(x: 40, y: -40)
                            }
                        }
                    }
                }
            }
        }
        .padding(20)
        .background(Color.Gray200)
    }
}

struct ProjectRetrospectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRetrospectionView()
    }
}
