//
//  ProjectValueSelectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct ProjectValueSelectView: View {
    var valueSelect: [String] = ["도전", "여유", "사랑"]
    @State var valueIndex: Int
    var body: some View {
        VStack(alignment: .leading) {
            Text("어떤 가치를 위한 프로젝트인가요?")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray900)
            HStack(spacing: 12) {
                Button {
                    valueIndex = 0
                } label: {
                    Text(valueSelect[0])
                        .frame(width: 148, height: 48)
                        .font(.ssWhiteBody1)
                        .foregroundColor(.GrayBlack)
                }
                .cornerRadius(12)
                .buttonStyle(.borderedProminent)
                .tint(valueIndex != 0 ? .Gray300 : .SeeSawGreen)
                Button {
                    valueIndex = 1
                } label: {
                    Text(valueSelect[1])
                        .frame(width: 148, height: 48)
                        .font(.ssWhiteBody1)
                        .foregroundColor(.GrayBlack)
                }
                .cornerRadius(12)
                .buttonStyle(.borderedProminent)
                .tint(valueIndex != 1 ? .Gray300 : .SeeSawGreen)
            }
            HStack(spacing: 12) {
                Button {
                    valueIndex = 2
                } label: {
                    Text(valueSelect[2])
                        .frame(width: 148, height: 48)
                        .font(.ssWhiteBody1)
                        .foregroundColor(.GrayBlack)
                }
                .cornerRadius(12)
                .buttonStyle(.borderedProminent)
                .tint(valueIndex != 2 ? .Gray300 : .SeeSawGreen)
                Button {
                    valueIndex = 3
                } label: {
                    Text("미선택")
                        .frame(width: 148, height: 48)
                        .font(.ssWhiteBody1)
                        .foregroundColor(.GrayBlack)
                }
                .cornerRadius(12)
                .buttonStyle(.borderedProminent)
                .tint(valueIndex != 3 ? .Gray300 : .SeeSawGreen)
            }
        }
    }
}

struct ProjectValueSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectValueSelectView(valueSelect: ["도전", "여유", "사랑"], valueIndex: 0)
    }
}
