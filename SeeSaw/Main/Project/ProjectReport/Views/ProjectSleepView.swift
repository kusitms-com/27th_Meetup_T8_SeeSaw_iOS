//
//  ProjectSleepView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectSleepView: View {
    var sleep: Int = 6
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("평균적으로")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .foregroundColor(.Gray900)
            HStack(spacing: 0) {
                Text("하루 ")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
                Text("\(sleep)")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.SeeSawBlue)
                Text("시간 잤어요")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
            }
            Spacer()
                .frame(height: 50)
            Image("ProjectMoonImage")
                .resizable()
                .frame(width: 250, height: 350)
            Spacer()
        }
        .padding(24)
        .frame(height: 550)
        .background(Color.Gray100)
    }
}

struct ProjectSleepView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectSleepView()
    }
}
