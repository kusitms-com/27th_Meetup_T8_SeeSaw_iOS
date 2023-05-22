//
//  ProjectRectangleVIew.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/19.
//

import SwiftUI

struct ProjectRectangleVIew: View {
    @State private var showModal = false
    @State private var isEdit = false
    @State private var isDetail = false
    var dataItem: MyModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack {
                    Button {
                        showModal.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                    }
                    .halfSheet(showSheet: $showModal) {
                        ProjectEditModalView(projectTitle: dataItem.title, isEdit: $isEdit, showModal: $showModal)
                            .background(.white)
                    } onEnd: {
                        print("close")
                    }
                    if isEdit {
                        NavigationLink(" ", destination:
                                        AddProjectView(isEdit: true), isActive: $isEdit)
                    }
                    Spacer()
                        .frame(height: 3)
                    Text(dataItem.value)
                        .font(.ssBlackTitle1)
                        .foregroundColor(.white)
                }
                Spacer()
                    .frame(width: 100)
                NavigationLink(destination: ProjectDetailView(projectTitle: dataItem.title, projectStrength: dataItem.strength, projectGoal: dataItem.strength, projectProgress: Int(dataItem.progress))) {
//                    Button {
//                        isDetail.toggle()
//                    } label: {
                        Image(systemName: "arrow.up.right")
                            .frame(width: 28, height: 28)
                            .foregroundColor(.Gray900)
                            .background(.white)
                            .cornerRadius(30)
                            .offset(x: 0, y: -10)
//                    }
                }
            }
            Spacer()
                .frame(height: 40)
            Text(dataItem.title)
                .font(.ssBlackTitle1)
                .foregroundColor(.Gray900)
            Text(dataItem.strength)
                .font(.ssWhiteBody3)
                .foregroundColor(.Gray900)
                .frame(width: 70, height: 18)
                .background(.white)
                .cornerRadius(30)
            ProgressView(value: dataItem.progress)
                .frame(width: 150)
                .progressViewStyle(LinearProgressViewStyle(tint: .Gray900))
                .background(.white)
        }
    }
}

struct ProjectRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRectangleVIew(dataItem: MyModel.DataArray[0])
    }
}
