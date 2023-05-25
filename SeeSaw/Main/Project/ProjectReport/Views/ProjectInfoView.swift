//
//  ProjectInfoView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectInfoView: View {
    var projectColor: Color = .SeeSawBlue
    var projectReportInfo = ProjectReportInfo()
    @State var projectValue: String = "성장"
    @State var projectTitle: String = "인지심리학 대학원 연구 프로젝트"
    @State var projectStartDate: String = ""
    @State var projectEndDate: String = ""
    @State var projectStrength: String = "Medium"
    @State var projectGoal: String = "인지심리학으로 진로에 대한 확신 얻기"
    var words: [String] {
        projectTitle.split(separator: " ").map { String($0) }
    }
    var firstHalf: String {
        words.prefix(words.count / 2).joined(separator: " ")
    }
    var secondHalf: String {
        words.suffix(from: words.count / 2).joined(separator: " ")
    }
    var goalWords: [String] {
        projectGoal.split(separator: " ").map { String($0) }
    }
    var goalFirstHalf: String {
        goalWords.prefix(words.count / 2).joined(separator: " ")
    }
    var goalSecondHalf: String {
        goalWords.suffix(from: words.count / 2).joined(separator: " ")
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("\(projectValue)")
                    .font(.ssHeading1)
                    .foregroundColor(.white)
            }
            Spacer()
            Text("\(firstHalf)\n\(secondHalf)")
                .font(.ssHeading1)
                .foregroundColor(.Gray100)
            HStack {
                Text("\(projectStartDate) - \(projectEndDate)")
                    .font(.ssBlackTitle2)
                    .foregroundColor(.Gray100)
            }
            Text(projectStrength)
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray100)
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .background(Color.Gray900)
                .cornerRadius(90)
            Text("\(goalFirstHalf)\n\(goalSecondHalf)")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(.Gray100)
            Rectangle()
                .frame(width: 252, height: 1)
                .foregroundColor(.Gray900)
            Text("함께 진행한 프로젝트")
                .font(.ssBlackBody3)
                .foregroundColor(.Gray900)
                
        }
        .onAppear {
            projectValue = projectReportInfo.value
            projectTitle = projectReportInfo.projectName
            projectStartDate = projectReportInfo.startedAt
            projectEndDate = projectReportInfo.endedAt
            projectStrength = projectReportInfo.projectIntensity
            projectGoal = projectReportInfo.projectGoal
            
        }
        .padding(20)
        .background(projectColor)
    }
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}

