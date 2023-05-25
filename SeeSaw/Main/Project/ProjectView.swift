//
//  ProjectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/04/26.
//

import SwiftUI

struct ProjectView: View {
    @AppStorage("nickname") var nickname: String = ""
    @State private var currentTime: Date = Date()
    @State var isProgress = true
    @State var progressNum: Int = 0
    @State var completeNum: Int = 0
    @StateObject var projectVM = ProjectViewModel()
    @State var todayQuestion: String = ""
    @State var showDeletePopUp: Bool = false
    var words: [String] {
        todayQuestion.split(separator: " ").map { String($0) }
    }
    var firstHalf: String {
        words.prefix(words.count / 2).joined(separator: " ")
    }
    var secondHalf: String {
        words.suffix(from: words.count / 2).joined(separator: " ")
    }
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MainToolBar(feature: .projectLog)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("\(nickname)님의")
                            .font(.ssHeading1)
                            .foregroundColor(.GrayBlack)
                            .padding(.top, 10)
                        Text("프로젝트 회고")
                            .font(.ssHeading1)
                            .foregroundColor(.GrayBlack)
                    }
                    .padding(.leading, 20)
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.Gray100)
                            .frame(width: 350, height: 100)
                            .overlay(
                                Image("CloverImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 250)
                                    .offset(x: 100, y: -30)
                            )
                        HStack {
                            VStack(alignment: .leading) {
                                Text("오늘의 회고 질문")
                                    .font(.ssBlackBody2)
                                    .foregroundColor(.Gray600)
                                    .padding(.bottom, 4)
                                Text(firstHalf)
                                    .font(.ssBlackTitle2)
                                    .foregroundColor(.Gray800)
                                Text(secondHalf)
                                    .font(.ssBlackTitle2)
                                    .foregroundColor(.Gray800)
                            }                        .padding(.horizontal, 10)
                            Spacer()
                        }
                        .padding(.leading, 20)
                    }
                    VStack {
                        Spacer()
                            .frame(height: 30)
                        HStack(spacing: 30) {
                            Button {
                                withAnimation {
                                    isProgress = true
                                }
                            } label: {
                                Text("진행 중(\(progressNum))")
                                    .font(.ssWhiteBody1)
                                    .foregroundColor(isProgress ? .Gray900 : .Gray500)
                            }
                            Spacer()
                                .frame(width: 50)
                            Button {
                                withAnimation {
                                    isProgress = false
                                }
                            } label: {
                                Text("완료(\(completeNum))")
                                    .font(.ssWhiteBody1)
                                    .foregroundColor(isProgress ? .Gray500 : .Gray900)
                            }
                        }
                        ZStack {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.Gray300)
                            if isProgress {
                                HStack {
                                    Rectangle()
                                        .frame(width: 100, height: 2)
                                        .foregroundColor(.GrayBlack)
                                    Spacer()
                                        .frame(width: 165)
                                }
                            } else {
                                HStack {
                                    Spacer()
                                        .frame(width: 165)
                                    Rectangle()
                                        .frame(width: 100, height: 2)
                                        .foregroundColor(.GrayBlack)
                                }
                            }
                        }
                        if isProgress {
                            ProgressProjectView(progressNum: $progressNum, showDeletePopUp: $showDeletePopUp)
                        } else {
                            CompleteProjectView(completeNum: $completeNum, showDeletePopUp: $showDeletePopUp)
                        }
                    }
                }
                .background(Color.Gray200)
            }
            if showDeletePopUp {
                ProjectDeletePopUpView(showDeletePopUp: $showDeletePopUp)
            }
        }
        .background(Color.Gray200)
        .onAppear {
            projectVM.getTodayReviewQuestion {id, contents in
                todayQuestion = contents
            }
            projectVM.getProgressCompleteCount { progress, complete in
                progressNum = progress
                completeNum = complete
            }
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
