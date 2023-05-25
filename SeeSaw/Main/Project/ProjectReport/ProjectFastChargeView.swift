//
//  ProjectFastChargeVIew.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectFastChargeView: View {
    var value: [String] = ["희망", "성장", "끈기"]
    var valueNum: [Int] = [41, 34, 22]
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 0) {
                Text("\(value[0]) 고속충전 ")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
                Text("\(valueNum[0])")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.SeeSawBlue)
                Text("회")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
            }
            HStack(spacing: 0) {
                Text("\(value[1]) 고속충전 ")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
                Text("\(valueNum[1])")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.SeeSawBlue)
                Text("회")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
            }
            HStack(spacing: 0) {
                Text("\(value[2]) 고속충전 ")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
                Text("\(valueNum[2])")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.SeeSawBlue)
                Text("회")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.Gray900)
            }
            Spacer()
                .frame(height: 50)
            Image("ProjectBatteryImage")
                .resizable()
                .frame(width: 250, height: 350)
            Spacer()
        }
        .padding(24)
        .frame(height: 550)
        .background(Color.Gray100)
    }
}

struct ProjectFastChargeView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectFastChargeView()
    }
}
