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
    @State var isFinal: Bool = false
    var projectTitle: String
    var projectId: Int = 0
    var isProjectReport: Bool = false
    var emojiList: [String] = ["LIKE", "NICE", "IDK", "ANGRY", "SAD"]
    let numbers = 0...4
    var halfDate: String = ""
    var endedAt: String = ""
    @StateObject var projectDetailVM = ProjectDetailViewModel()
    @StateObject var middleFinalReviewVM = MiddleFinalReviewViewModel()
    @State var middleRemembranceId: Int = 0
    @State var finalRemembranceId: Int = 0
    @State var isMiddleRemembrance: Bool = false
    @State var isFinalRemembrance: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                isMiddle.toggle()
            } label: {
                Text("middleToggle")
            }
            Button {
                isFinal.toggle()
            } label: {
                Text("finalToggle")
            }
            Text("프로젝트에서 느낀 감정을 자유롭게 눌러주세요")
                .font(.ssBlackBody1)
                .foregroundColor(.Gray900)
                .padding(.bottom, 12)
                .padding(.leading, 20)
            
            VStack(alignment: .center) {
                // 감정 선택 버튼
                HStack(spacing: 24) {
                    ForEach(numbers, id: \.self) { number in
                        VStack {
                            Button {
                                emojiNum[number] += 1
                                projectDetailVM.postProjectEmotion(projectId: projectId, emotion: emojiList[number])
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
                .padding(.bottom, 16)
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        NavigationLink(destination: ProjectRegularRetrospectionView(projectId: projectId)) {
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
                        ZStack(alignment: .topTrailing) {
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: 180, height: 180)
                                .foregroundColor(.SeeSawYellow.opacity(isMiddle ? 1 : 0.6))
                                .overlay(
                                    VStack {
                                        Text("중간 회고")
                                            .font(.ssBlackTitle2)
                                            .foregroundColor(.Gray700)
                                        if !isMiddle {
                                            Text("\(halfDate)에 열려요")
                                                .font(.ssBlackBody3)
                                                .foregroundColor(.Gray700)
                                        }
                                    }
                                )
                            if isMiddle {
                                NavigationLink(destination: InterimReviewView(projectTitle: projectTitle, middleRemembranceId: middleRemembranceId)) {
                                    ArrowUpRightView()
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    if !isMiddleRemembrance {
                                        middleFinalReviewVM.postRemembranceId(type: "MIDDLE", projectId: projectId)
                                        isMiddleRemembrance = true
                                    }
                                })
                                .padding(.top, 30)
                                .padding(.trailing, 30)
                            }
                        }
                    }
                    HStack(spacing: 0) {
                        ZStack(alignment: .topTrailing) {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 180, height: 180)
                                .foregroundColor(.SeeSawYellow.opacity(isFinal ? 1 : 0.6))
                                .overlay(
                                    VStack {
                                        Text("마지막 회고")
                                            .font(.ssBlackTitle2)
                                            .foregroundColor(.Gray700)
                                        if !isFinal {
                                            Text("\(endedAt)에 열려요")
                                                .font(.ssBlackBody3)
                                                .foregroundColor(.Gray700)
                                        }
                                    }
                                )
                            if isFinal {
                                NavigationLink(destination: FinalReviewView(projectTitle: projectTitle, finalRemembranceId: finalRemembranceId)) {
                                    ArrowUpRightView()
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    if !isFinalRemembrance {
                                        middleFinalReviewVM.postRemembranceId(type: "FINAL", projectId: projectId)
                                    }
                                })
                                .padding(.top, 30)
                                .padding(.trailing, 30)
                                
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
                
                HStack { Spacer() }
            }
        }
        .background(Color.Gray200)
    }
}
