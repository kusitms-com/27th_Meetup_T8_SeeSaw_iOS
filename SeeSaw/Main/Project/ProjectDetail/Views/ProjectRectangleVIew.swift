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
    @State var showDeleteModal = false
    @Binding var showDeletePopUp: Bool
    @StateObject var api = ApiClient()
    @StateObject var projectDetailVM = ProjectDetailViewModel()
    var progressProject: ProgressCompleteProject
    var projectId: Int = 0
    var isProgress: Bool = true
    @State var valueName: [String] = []
    @State var projectDetailInfo: ProjectDetailInfo = ProjectDetailInfo()
    var year: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: Date())
        return components.year!
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack {
                    if isProgress {
                        Button {
                            showModal = true
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.white)
                        }
                        .halfSheet(showSheet: $showModal) {
                            ProjectEditModalView(projectTitle: progressProject.projectName, projectId: projectId, isEdit: $isEdit, showModal: $showModal, showDeleteModal: $showDeleteModal)
                                .background(Color.Gray200)
                        } onEnd: {
                            print("close")
                        }
                        .halfSheet(showSheet: $showDeleteModal) {
                            ProjectDeleteModalView(projectTitle: progressProject.projectName, projectId: projectId, showDeleteModal: $showDeleteModal, showDeletePopUp: $showDeletePopUp)
                                .background(Color.Gray200)
                        } onEnd: {
                            print("close")
                        }
                    }
                    if isEdit {
                        NavigationLink(" ", destination:
                                        AddProjectView(isEdit: true, projectId: projectId, projectName: projectDetailInfo.projectName, strength: projectDetailInfo.intensity, valueId: projectDetailInfo.valueId, valueName: valueName), isActive: $isEdit)
                    }
                    Spacer()
                        .frame(height: 3)
                    Text(progressProject.valueName)
                        .font(.ssBlackTitle1)
                        .foregroundColor(.white)
                }
                Spacer()
                    .frame(width: 100)
                NavigationLink(destination: ProjectDetailView(projectDetailInfo: projectDetailInfo, projectId: progressProject.projectId)) {
                        Image(systemName: "arrow.up.right")
                            .frame(width: 28, height: 28)
                            .foregroundColor(.Gray900)
                            .background(.white)
                            .cornerRadius(30)
                            .offset(x: 0, y: -10)
                }
            }
            Spacer()
                .frame(height: 40)
            Text(progressProject.projectName)
                .font(.ssBlackTitle1)
                .foregroundColor(.Gray900)
            Text(progressProject.intensity)
                .font(.ssWhiteBody3)
                .foregroundColor(.Gray900)
                .frame(width: 70, height: 18)
                .background(.white)
                .cornerRadius(30)
            ProgressView(value: progressProject.progressRate / 100)
                .frame(width: 150)
                .progressViewStyle(LinearProgressViewStyle(tint: .Gray900))
                .background(.white)
        }
        .onAppear {
            api.getValues(year: year) { value in
                self.valueName = value
            }
            projectDetailVM.getProjectDetailInfo(projectId: self.projectId) { project in
                    projectDetailInfo = project
            }
        }
    }
}
