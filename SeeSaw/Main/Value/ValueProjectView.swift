//
//  ValueProjectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/17.
//

import SwiftUI

struct ValueProjectView: View {
    var valueId: Int = 0
    @StateObject var valueVM = ValueViewModel()
    @State var projectList: [ProjectNameRate] = []
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(projectList, id: \.self, content: { (dataItem: ProjectNameRate) in
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 350, height: 35)
                            .foregroundColor(.Gray200)
                        HStack {
                            Text(dataItem.projectName)
                            Spacer()
                            ValueProgressView(value: Double(dataItem.progressRate), backColor: .Gray300, foreColor: .black)
                                .frame(width: 160, height: 12)
                        }
                        .padding(.leading, 30)
                        .padding(.trailing, 25)
                    }
                    .padding(.leading, 12)
                    .padding(.trailing, 12)
                })
            }
        }
        .onAppear {
            valueVM.getProject(valueId: valueId) { projects in
                projectList = projects
            }
        }
    }
}

//struct ValueProjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        ValueProjectView(projectList: [{projectName: "큐시즘 기업 프로젝트", progressRate: 100.0]})
//    }
//}
