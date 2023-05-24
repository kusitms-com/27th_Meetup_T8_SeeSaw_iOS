//
//  ProjectGoalView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/08.
//

import SwiftUI

struct ProjectGoalView: View {
    @State var projectGoal: String = ""
    var maxLength: Int = 20
    @State var valueName: [String] = []
    @Binding var isGoal: Bool
    @Binding var goal: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("프로젝트 목표를 적어주세요")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray900)
            HStack {
                TextField("프로젝트 목표", text: Binding(
                    get: { self.projectGoal },
                    set: { newValue in
                        if newValue.count <= maxLength {
                            self.projectGoal = newValue
                            self.goal = newValue
                        }
                        if newValue.count > 0 {
                            isGoal = true
                        }
                    }
                ))
                Text("\(projectGoal.count)/20")
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray600)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.Gray300)
            Spacer()
        }
    }
}

//struct ProjectGoalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectGoalView(isGoal: .constant(false))
//    }
//}
