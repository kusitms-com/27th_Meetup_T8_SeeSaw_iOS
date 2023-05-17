//
//  AddProjectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct AddProjectView: View {
    @State var projectName: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .leading) {
            ProjectNameView()
            Spacer()
                .frame(height: 40)
            ProjectTermView()
            Spacer()
                .frame(height: 40)
            ProjectStrengthView()
            Spacer()
                .frame(height: 40)
            ProjectValueSelectView(valueSelect: ["도전", "여유", "행복"], valueIndex: -1)
            Spacer()
                .frame(height: 40)
            ProjectGoalView()
            Button {
                
            } label: {
                CapsuleButtonView(color: .Gray400, text: "추가하기", size: .large)
            }
        }
        .padding(20)
        .navigationBarTitle("새로운 프로젝트 추가", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
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
