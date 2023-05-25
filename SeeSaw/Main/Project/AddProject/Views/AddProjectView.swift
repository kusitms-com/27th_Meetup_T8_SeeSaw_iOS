//
//  AddProjectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct AddProjectView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var api = ApiClient()
    @StateObject var addProjectVM = AddProjectViewModel()
    var isEdit: Bool = false
    var projectId: Int = 0
    @State var projectName: String = ""
    @State var strength: String = ""
    @State var startedAt: Date = Date()
    @State var endedAt: Date = Date()
    @State var value: String = ""
    @State var valueId: Int?
    @State var goal: String = ""
    @State var isName: Bool = false
    @State var isStrength: Bool = false
    @State var isValue: Bool = false
    @State var isGoal: Bool = false
    @State var valueName: [String] = []
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ProjectNameView(projectName: self.$projectName, isName: self.$isName)
                Spacer()
                    .frame(height: 36)
                ProjectTermView(startDate: self.$startedAt, endDate: self.$endedAt)
                Spacer()
                    .frame(height: 36)
                ProjectStrengthView(isStrength: self.$isStrength, strength: self.$strength)
                Spacer()
                    .frame(height: 36)
                ProjectValueSelectView(valueName: self.valueName, isValue: self.$isValue, valueId: self.$valueId)
                Spacer()
                    .frame(height: 36)
                ProjectGoalView(isGoal: self.$isGoal, goal: self.$goal)
                NavigationLink {
                    SeeSawTabView(tabIndex: .project)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    CapsuleButtonView(color: (isName && isStrength && isValue && isGoal) ? .SeeSawGreen : .Gray400, text: (isEdit ? "수정하기" : "추가하기"), size: .large)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    if isEdit {
                        addProjectVM.putProject(projectId: projectId, valueId: valueId, projectName: projectName, startedAt: startedAt, endedAt: endedAt, intensity: strength, goal: goal)
                    } else {
                        addProjectVM.postProject(valueId: valueId ?? nil, projectName: projectName, startedAt: startedAt, endedAt: endedAt, intensity: strength, goal: goal)
                    }
                })
                .disabled(!(isName && isStrength && isValue && isGoal))
                
            }
            .padding(20)
            .navigationBarTitle(isEdit ? "프로젝트 수정" : "새로운 프로젝트 추가", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            )
        }
        .onAppear {
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView()
    }
}
