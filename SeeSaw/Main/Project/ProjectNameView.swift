//
//  ProjectNameView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct ProjectNameView: View {
    @State var projectName: String = ""
    var maxLength: Int = 10
    var body: some View {
        VStack(alignment: .leading) {
            Text("프로젝트 명을 입력해주세요")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray900)
            HStack {
                TextField("프로젝트 명", text: Binding(
                    get: { self.projectName },
                    set: { newValue in
                        if newValue.count <= maxLength {
                            self.projectName = newValue
                        }
                    }
                ))
                Spacer()
                Text("\(projectName.count)/10")
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray600)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.Gray300)
        }
    }
}

struct ProjectNameView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectNameView()
    }
}
