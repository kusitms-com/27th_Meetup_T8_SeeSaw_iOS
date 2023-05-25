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
        ScrollView {
            VStack(spacing: 0) {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 140), spacing: 12, alignment: .center),
                    GridItem(.adaptive(minimum: 140), spacing: 12, alignment: .center)
                ], spacing: 4, content: {
                    ForEach(completeProject, id: \.self, content: { (project: ProgressCompleteProject) in
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main.bounds.size.width / 2 - 20, height: 200)
                                .foregroundColor(.Gray300)
                            ProjectRectangleVIew(showDeletePopUp: $showDeletePopUp, progressProject: project, isProgress: false, valueName: valueName)
                        }
                    })
                })
                
                Rectangle()
                    .frame(height: 80)
                    .foregroundColor(.Gray200)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
        .onAppear {
            projectVM.getCompleteProject { complete in
                completeProject = complete
                completeNum = complete.count
            }
        }
    }
}
