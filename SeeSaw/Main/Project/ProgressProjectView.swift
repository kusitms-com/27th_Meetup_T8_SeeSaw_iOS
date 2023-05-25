//
//  ProgressView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/05.
//

import SwiftUI

struct MyModel: Identifiable {
    let id = UUID()
    let value: String
    let title: String
    let content: String
    let strength: String
    let progress: Float
}

extension MyModel {
    static var DataArray: [MyModel] {
        (1...6).map { (number: Int) in
            MyModel(value: "\(number)", title: "타이틀: \(number)", content: "컨텐트: \(number)", strength: "high", progress: Float(number) / 10)
        }
    }
}

struct ProgressProjectView: View {
    @State private var showModal = false
    @State private var isEdit = false
    @State private var isDetail = false
    @State var colorIndex: Int = 0
    @StateObject var projectVM = ProjectViewModel()
    @State var progressProject: [ProgressCompleteProject] = []
    @State var colorArray: [Color] = [.SeeSawYellow, .SeeSawBlue, .SeeSawRed, .Gray300]
    @StateObject var api = ApiClient()
    @State var valueName: [String] = []
    @Binding var progressNum: Int
    @Binding var showDeletePopUp: Bool
    var year: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: Date())
        return components.year!
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 140), spacing: 12, alignment: .center),
                    GridItem(.adaptive(minimum: 140), spacing: 12, alignment: .center)
                ], spacing: 4, content: {
                    NavigationLink(destination: AddProjectView(valueName: valueName)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main.bounds.size.width / 2 - 20, height: 200)
                                .foregroundColor(.Gray300)
                            VStack(alignment: .leading) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 28, height: 28)
                                Spacer()
                                HStack {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("새로운")
                                            .font(.ssWhiteBody1)
                                            .foregroundColor(.white)
                                        Text("프로젝트를")
                                            .font(.ssWhiteBody1)
                                            .foregroundColor(.white)
                                        Text("추가해보세요")
                                            .font(.ssWhiteBody1)
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                }
                            }
                            .padding(20)
                        }
                    }
                    
                    ForEach(progressProject, id: \.self, content: { (project: ProgressCompleteProject) in
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main.bounds.size.width / 2 - 20, height: 200)
                                .foregroundColor(colorArray[getColorIndex(value: project.valueName)])
                            ProjectRectangleVIew(showDeletePopUp: $showDeletePopUp, progressProject: project, projectId: project.projectId, valueName: valueName)
                        }
                    })
                })
                
                if progressProject.count == 0 {
                    VStack {
                        Spacer()
                            .frame(height: 85)
                        Text("피드가 텅 비어있어요")
                            .font(.ssBlackTitle1)
                            .foregroundColor(.Gray600)
                            .padding(.bottom, 5)
                        Text("프로젝트를 추가하고")
                            .font(.ssBlackBody3)
                            .foregroundColor(.Gray600)
                        Text("일과 삶의 균형을 찾아보세요")
                            .font(.ssBlackBody3)
                            .foregroundColor(.Gray600)
                    }
                }
                
                Rectangle()
                    .frame(height: 80)
                    .foregroundColor(.Gray200)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
        .onAppear {
            projectVM.getProgressProject { progress in
                progressProject = progress
                progressNum = progress.count
            }
            api.getValues(year: year) { value in
                self.valueName = value
            }
        }
    }
    
    func getColorIndex(value: String) -> Int {
        let index = valueName.firstIndex(of: value)
        return index ?? 3
    }
}
