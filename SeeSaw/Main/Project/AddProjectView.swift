//
//  AddProjectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct AddProjectView: View {
    var isEdit: Bool = false
    @State var projectName: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .leading) {
            ProjectNameView()
            Spacer()
                .frame(height: 36)
            ProjectTermView()
            Spacer()
                .frame(height: 36)
            ProjectStrengthView()
            Spacer()
                .frame(height: 36)
            ProjectValueSelectView(valueSelect: ["도전", "여유", "행복"], valueIndex: -1)
            Spacer()
                .frame(height: 36)
            ProjectGoalView()
            Button {
                
            } label: {
                CapsuleButtonView(color: .Gray400, text: (isEdit ? "수정하기" : "추가하기"), size: .large)
            }
        }
        .padding(20)
        .navigationBarTitle("새로운 프로젝트 추가", displayMode: .inline)
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

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView()
    }
}
