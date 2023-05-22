//
//  ProjectCalorieView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectCalorieView: View {
    var calori: Int = 267
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
                Text("\(calori)")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.SeeSawBlue)
                Text("Kcal 움직였어요")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
            }
            Spacer()
                .frame(height: 50)
            Image("ProjectFireImage")
                .resizable()
                .frame(width: 250, height: 350)
            Spacer()
        }
        .padding(24)
        .frame(height: 550)
        .background(Color.Gray100)
    }
}

struct ProjectCalorieView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCalorieView()
    }
}
