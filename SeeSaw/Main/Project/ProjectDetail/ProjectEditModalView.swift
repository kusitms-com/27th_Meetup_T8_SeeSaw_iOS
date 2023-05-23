//
//  ProjectDeleteModalView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/17.
//

import SwiftUI

struct ProjectEditModalView: View {
    var projectTitle: String
    @Binding var isEdit: Bool
    @Binding var showModal: Bool
    @Binding var showDeleteModal: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            VStack(spacing: 12) {
                Color.white.ignoresSafeArea()
                Text("프로젝트 편집")
                    .font(.ssBlackTitle2)
                    .foregroundColor(.Gray500)
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(.Gray300)
                Spacer()
                    .frame(height: 56)
                Text("프로젝트를 수정하거나 삭제하시겠어요?")
                    .font(.ssBlackTitle2)
                Spacer()
                    .frame(height: 40)
                Button {
                    isEdit.toggle()
                    showModal.toggle()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    CapsuleButtonView(color: .Gray900, text: "수정", size: .large)
                }
                Button {
                    showDeleteModal.toggle()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    CapsuleButtonView(color: .Gray400, text: "삭제", size: .large)
                }
                .halfSheet(showSheet: $showDeleteModal) {
                    ProjectDeleteModalView(projectTitle: self.projectTitle, showDeleteModal: self.$showDeleteModal)
                        .background(.white)
                } onEnd: {
                    print("close")
                }
            }
            .padding(20)
    }
}

struct ProjectEditModalView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectEditModalView(projectTitle: "큐시즘 기업프로젝트", isEdit: .constant(true), showModal: .constant(true), showDeleteModal: .constant(false))
    }
}
