//
//  ProjectInfoView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectInfoView: View {
    var projectColor: Color = .SeeSawBlue
    var projectValue: String = "성장"
    var projectTitle: String = "인지심리학 대학원 연구 프로젝트"
    var projectStartDate: Date {
        var components = DateComponents()
        components.year = 2023
        components.month = 3
        components.day = 13

        let calendar = Calendar.current
        return calendar.date(from: components)!
    }
    var projectEndDate: Date {
        var components = DateComponents()
        components.year = 2023
        components.month = 5
        components.day = 23

        let calendar = Calendar.current
        return calendar.date(from: components)!
    }
    var projectStrength: String = "Medium"
    var projectGoal: String = "인지심리학으로 진로에 대한 확신 얻기"
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
                Text("\(formatDate(date: projectStartDate)) - \(formatDate(date: projectEndDate))")
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

struct ProjectInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectInfoView()
    }
}
