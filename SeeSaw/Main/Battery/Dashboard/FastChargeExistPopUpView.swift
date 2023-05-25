//
//  FastChargeExistPopUpView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/22.
//

import SwiftUI

struct FastChargeExistPopUpView: View {
    @Binding var showFastChargeExistPopUp: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
            
            SmallPopUpView(title: "고속충전",
                           isXmarkExist: false,
                           isImageExist: true,
                           isImageGIF: false,
                           imageName: "FastChargeAlreadyExist",
                           text: "오늘 이미 고속충전을 완료했어요\n내일 다시 충전해보세요!",
                           buttonContext: "확인",
                           buttonColor: Color.Gray900,
                           buttonAction: closePopUp)
        }
    }
    
    func closePopUp() {
        showFastChargeExistPopUp = false
    }
}
