//
//  ProjectDetailView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/16.
//

import SwiftUI

struct ProjectDetailView: View {
    var projectTitle: String = ""
    var projectStrength: String
    var projectGoal: String
    var projectProgress: Int
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
    var words: [String] {
        projectTitle.split(separator: " ").map { String($0) }
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
                Text("\(projectStrength)")
                    .foregroundColor(.Gray100)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 2)
                    .background(Color.Gray900)
                    .cornerRadius(90)
                Text("\(projectGoal)")
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray900)
            }
            .padding(.horizontal, 20)
            ZStack {
                ValueProgressView(value: Double(projectProgress) / 100, backColor: .Gray300, foreColor: .Gray900)
                    .frame(height: 20)
                HStack {
                    Text("\(formatDate(date: projectStartDate))")
                        .font(.ssBlackBody3)
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(formatDate(date: projectEndDate))")
                        .font(.ssBlackBody3)
                        .foregroundColor(.Gray900)
                }
                .padding(.horizontal, 10)
            }
            .padding(.horizontal, 20)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.Gray300)
            ProjectRetrospectionView()
        }
    }
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailView(projectTitle: "큐시즘 밋업데이", projectStrength: "high", projectGoal: "서비스 기획 뽀개기", projectProgress: 30)
    }
}
