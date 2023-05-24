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
                TextField("", text: Binding(
                    get: { self.projectName },
                    set: { newValue in
                        if newValue.count <= maxLength {
                            self.projectName = newValue
                        }
                        if newValue.count > 0 {
                            self.isName = true
                        }
                    }
                ))
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

//struct ProjectNameView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectNameView(isName: .constant(false))
//    }
//}
