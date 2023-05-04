//
//  SelectDeleteAccountView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct SelectDeleteAccountView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("정말 시소를 떠날건가요?")
                .font(.ssHeading2)
                .padding(.top, 32)
                .padding(.bottom, 12)
            Text("지금 시소를 탈퇴하게 되면,")
                .font(.ssBlackBody2)
                .foregroundColor(.Gray600)
            Text("남기셨던 모든 데이터와 기록이 사라지고 복원되지 않아요.")
                .font(.ssBlackBody2)
                .foregroundColor(.Gray600)
            
            Spacer()
            
            VStack {
                CapsuleButtonView(isActive: false, text: "탈퇴할래요", size: .large)
                    .padding(.bottom, 12)
                CapsuleButtonView(isActive: true, text: "탈퇴 안 할래요", size: .large)
                    .padding(.bottom, 20)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct SelectDeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDeleteAccountView()
    }
}
