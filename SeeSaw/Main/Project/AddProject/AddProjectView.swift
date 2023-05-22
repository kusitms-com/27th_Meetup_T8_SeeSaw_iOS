//
//  AddProjectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct AddProjectView: View {
    @Environment(\.presentationMode) var presentationMode
    var isEdit: Bool = false
    @State var projectName: String = ""
    @State var isName: Bool = false
    @State var isStrength: Bool = false
    @State var isValue: Bool = false
    @State var isGoal: Bool = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ProjectNameView(isName: self.$isName)
                Spacer()
                    .frame(height: 36)
                ProjectTermView()
                Spacer()
                    .frame(height: 36)
                ProjectStrengthView(isStrength: self.$isStrength)
                Spacer()
                    .frame(height: 36)
                ProjectValueSelectView(valueSelect: ["도전", "여유", "행복"], valueIndex: -1, isValue: self.$isValue)
                Spacer()
                    .frame(height: 36)
                ProjectGoalView(isGoal: self.$isGoal)
                Button {
                    
                } label: {
                    CapsuleButtonView(color: (isName && isStrength && isValue && isGoal) ? .SeeSawGreen : .Gray400, text: (isEdit ? "수정하기" : "추가하기"), size: .large)
                    
                }
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
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView()
    }
}
