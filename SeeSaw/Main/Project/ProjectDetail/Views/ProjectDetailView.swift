//
//  ProjectDetailView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/16.
//

import SwiftUI

struct ProjectDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var projectDetailVM = ProjectDetailViewModel()
    @State var projectDetailInfo: ProjectDetailInfo = ProjectDetailInfo()
    var projectId: Int = 0
    var words: [String] {
        projectDetailInfo.projectName.split(separator: " ").map { String($0) }
    }
    var firstHalf: String {
        words.prefix(words.count / 2).joined(separator: " ")
    }
    var secondHalf: String {
        words.suffix(from: words.count / 2).joined(separator: " ")
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(firstHalf)\n\(secondHalf)")
                .font(.ssHeading1)
                .foregroundColor(.Gray900)
                .padding(.horizontal, 20)
            HStack {
                Text("\(projectDetailInfo.intensity)")
                    .foregroundColor(.Gray100)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 2)
                    .background(Color.Gray900)
                    .cornerRadius(90)
                Text("\(projectDetailInfo.goal)")
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray900)
            }
            .padding(.horizontal, 20)
            ZStack {
                ValueProgressView(value: Double(projectDetailInfo.progressRate) / 100, backColor: .Gray400, foreColor: .Gray900)
                    .frame(height: 20)
                HStack {
                    Text("\(projectDetailInfo.startedAt)")
                        .font(.ssBlackBody3)
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(projectDetailInfo.endedAt)")
                        .font(.ssBlackBody3)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 10)
            }
            .padding(.horizontal, 20)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.Gray300)
            ProjectRetrospectionView(emojiNum: [projectDetailInfo.likeCnt, projectDetailInfo.niceCnt, projectDetailInfo.idkCnt, projectDetailInfo.angryCnt, projectDetailInfo.sadCnt], isMiddle:  projectDetailInfo.isHalfProgressed, isFinal: projectDetailInfo.isFinished, isProjectReport: projectDetailInfo.isProjectReport, projectTitle: projectDetailInfo.projectName, projectId: projectDetailInfo.projectId, halfDate: projectDetailInfo.halfDate, endedAt: projectDetailInfo.endedAt, middleRemembranceId: projectDetailInfo.middleRemembranceId ?? 0, finalRemembranceId: projectDetailInfo.finalRemembranceId ?? 0, isMiddleRemembrance: projectDetailInfo.middleRemembranceId != nil, isFinalRemembrance: projectDetailInfo.finalRemembranceId != nil)
        }
        .onAppear {
            projectDetailVM.getProjectDetailInfo(projectId: self.projectId) { project in
                    projectDetailInfo = project
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .padding(20)
        .navigationBarTitle("프로젝트", displayMode: .inline)
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
        .background(Color.Gray200)
    }
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
