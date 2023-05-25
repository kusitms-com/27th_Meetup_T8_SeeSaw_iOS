//
//  ProjectValueSelectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct ProjectValueSelectView: View {
    @State var valueSelect: [String: Int] = [:]
    var valueName: [String] = ["도전", "양념", "후추"]
    var year: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: Date())
        return components.year!
    }
    @State var valueIndex: Int = -1
    @Binding var isValue: Bool
    @StateObject var api = ApiClient()
    @Binding var valueId: Int?
    var body: some View {
        VStack(alignment: .leading) {
            Text("어떤 가치를 위한 프로젝트인가요?")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray900)
            HStack(spacing: 12) {
                Button {
                    valueIndex = 0
                    valueId = valueSelect[valueName[0]]!
                    isValue = true
                } label: {
                    Text(valueName[0])
                        .frame(width: 148, height: 36)
                        .font(.ssWhiteBody1)
                        .foregroundColor(.GrayBlack)
                }
                .cornerRadius(12)
                .buttonStyle(.borderedProminent)
                .tint(valueIndex != 0 ? .Gray300 : .SeeSawGreen)
                Button {
                    valueIndex = 1
                    valueId = valueSelect[valueName[1]]!
                    isValue = true
                } label: {
                    Text(valueName[1])
                        .frame(width: 148, height: 36)
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
                    valueId = valueSelect[valueName[2]]!
                    isValue = true
                } label: {
                    Text(valueName[2])
                        .frame(width: 148, height: 36)
                        .font(.ssWhiteBody1)
                        .foregroundColor(.GrayBlack)
                }
                .cornerRadius(12)
                .buttonStyle(.borderedProminent)
                .tint(valueIndex != 2 ? .Gray300 : .SeeSawGreen)
                Button {
                    valueIndex = 3
                    valueId = nil
                    isValue = true
                } label: {
                    Text("미선택")
                        .frame(width: 148, height: 36)
                        .font(.ssWhiteBody1)
                        .foregroundColor(.GrayBlack)
                }
                .cornerRadius(12)
                .buttonStyle(.borderedProminent)
                .tint(valueIndex != 3 ? .Gray300 : .SeeSawGreen)
            }
        }
        .onAppear {
            api.getValuesWithValueId(year: year) { value in
                self.valueSelect = value
            }
        }
    }
}
