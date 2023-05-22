//
//  ProjectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/04/26.
//

import SwiftUI

struct ProjectView: View {
    @AppStorage("nickname") var nickname: String = ""
    
    @State var isProgress = true
    @State var progressNum: Int = 0
    @State var completeNum: Int = 0
    
    var body: some View {
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
                                .rotationEffect(Angle(degrees: -10))
                        )
                    HStack {
                        VStack(alignment: .leading) {
                            Text("오늘의 회고 질문")
                                .font(.ssBlackBody2)
                                .foregroundColor(.Gray600)
                                .padding(.bottom, 4)
                            
                            Text("팀원들과의 협업은")
                                .font(.ssBlackTitle2)
                                .foregroundColor(.Gray800)
                            Text("잘 진행되고 있으신가요?")
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
                        ProgressProjectView()
                    } else {
                        CompleteProjectView()
                    }
                }
            }
            .background(Color.Gray200)
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
