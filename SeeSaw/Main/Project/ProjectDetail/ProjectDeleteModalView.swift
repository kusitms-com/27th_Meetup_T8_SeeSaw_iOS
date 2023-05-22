//
//  ProjectDeleteModalView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/17.
//

import SwiftUI

struct ProjectDeleteModalView: View {
    var projectTitle: String
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
                .frame(height: 36)
            Text(projectTitle)
                .font(.ssBlackSubTitle)
                .foregroundColor(.Gray700)
            Text("삭제하시겠어요?")
                .font(.ssBlackTitle2)
            Spacer()
                .frame(height: 40)
            Button {
                
            } label: {
                CapsuleButtonView(color: .Gray900, text: "삭제", size: .large)
            }
            Button {
                showDeleteModal.toggle()
                presentationMode.wrappedValue.dismiss()
            } label: {
                CapsuleButtonView(color: .Gray400, text: "취소", size: .large)
            }
        }
        .padding(20)
    }
}

struct ProjectDeleteModalView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDeleteModalView(projectTitle: "큐시즘 기업프로젝트", showDeleteModal: .constant(true))
    }
}
