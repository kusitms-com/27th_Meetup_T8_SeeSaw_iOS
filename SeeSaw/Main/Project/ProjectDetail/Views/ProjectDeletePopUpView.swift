//
//  ProjectDeletePopUpView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectDeletePopUpView: View {
    @Binding var showDeletePopUp: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
            
            SmallPopUpView(title: "삭제 완료",
                           isXmarkExist: false,
                           isImageExist: false,
                           isImageGIF: false,
                           imageName: "",
                           text: "삭제되었어요!",
                           buttonContext: "확인",
                           buttonColor: Color.Gray900,
                           buttonAction: closePopUp)
        }
    }
    func closePopUp() {
        showDeletePopUp = false
    }
}

