//
//  CompleteProjectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/05.
//

import SwiftUI

struct CompleteProjectView: View {
    @State private var showModal = false
    @State private var isEdit = false
    @State private var isDetail = false
    @StateObject var projectVM = ProjectViewModel()
    @State var completeProject: [ProgressCompleteProject] = []
    @StateObject var api = ApiClient()
    @State var valueName: [String] = []
    @Binding var completeNum: Int
    @Binding var showDeletePopUp: Bool
    var year: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: Date())
        return components.year!
    }
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.fixed(180)),
                    GridItem(.fixed(180))
                ], spacing: 10, content: {
                    ForEach(completeProject, id: \.self, content: { (project: ProgressCompleteProject) in
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main.bounds.size.width / 2 - 20, height: 200)
                                .foregroundColor(.Gray300)
                            ProjectRectangleVIew(showDeletePopUp: $showDeletePopUp, progressProject: project, isProgress: false, valueName: valueName)
                        }
                    })
                })
            }
        }
        .onAppear {
            projectVM.getCompleteProject { complete in
                completeProject = complete
                completeNum = complete.count
            }
        }
    }
}
