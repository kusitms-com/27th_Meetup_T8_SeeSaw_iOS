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
        GeometryReader { geometry in
            NavigationLink {
                ProjectDetailView(projectDetailInfo: projectDetailInfo,
                                  projectId: progressProject.projectId)
            } label: {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 0) {
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
                            
                            Text(progressProject.valueName)
                                .font(.ssBlackTitle1)
                                .foregroundColor(.white)
                                .padding(.top, isProgress ? 8 : 0)
                        }
                        
                        Spacer()
                        
                        // 넘어가는 버튼

                        Image(systemName: "arrow.up.right")
                            .frame(width: 28, height: 28)
                            .foregroundColor(.Gray900)
                            .background(.white)
                            .cornerRadius(30)
                            .offset(x: 0, y: -10)
                    }
                    
                    Spacer()
                    
                    Text(progressProject.projectName)
                        .font(.ssBlackTitle1)
                        .foregroundColor(.Gray900)
                        .frame(height: 48)
                        .multilineTextAlignment(.leading)
                    
                    // Low, Medium, High
                    Text(progressProject.intensity)
                        .font(.ssWhiteBody3)
                        .foregroundColor(.Gray900)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 12)
                        .background(
                            Rectangle()
                                .cornerRadius(30, corners: .allCorners)
                                .foregroundColor(.Gray100))
                    
                    // 진행률
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .cornerRadius(30, corners: .allCorners)
                            .frame(width: geometry.size.width, height: 8)
                            .foregroundColor(.GrayWhite)
                        Rectangle()
                            .cornerRadius(30, corners: .allCorners)
                            .frame(width: geometry.size.width * (progressProject.progressRate / 100), height: 8)
                            .foregroundColor(.Gray900)
                    }
                }
            }
        }
        .padding(20)
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
