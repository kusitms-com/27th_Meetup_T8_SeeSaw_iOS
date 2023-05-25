//
//  ProjectNameView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct ProjectNameView: View {
    @Binding var projectName: String
    @Binding var isName: Bool
    var maxLength: Int = 15
    var body: some View {
        VStack(alignment: .leading) {
            Text("프로젝트 명을 입력해주세요")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray900)
            HStack {
                TextField("", text: $projectName)
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray900)
                    .textInputAutocapitalization(.never)
                    .onChange(of: projectName, perform: {
                              projectName = String($0.prefix(maxLength))
                        if projectName.count > 0 { isName = true} else { isName = false }
                            })
                
                Spacer()
                
                Text("\(projectName.count)/15")
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray600)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.Gray300)
        }
    }
}
