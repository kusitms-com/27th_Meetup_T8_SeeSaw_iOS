//
//  ProvisioningEnergyView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/13.
//

import SwiftUI

enum ProvisioningEnergyDescription {
    static let allowTitle = """
시소가 건강앱에
접근할 수 있도록 허용하시겠어요?
"""
    static let allowMessage = """
건강 앱 접근을 허용하면,
앱 내 활동 데이터를 시소로 불러와요

나중에 설정에서 접근 허용 여부를 변경할 수 있어요
"""
    static let allowButtonMessage = "허용하고 계속하기"
    
    static let setGoalTitle = """
하루 목표 활동량을 설정해볼까요?
"""
    static let setGoalMessage = """
평소의 활동량 또는 원하는 수준의 활동량을 기준으로
하루 목표를 설정해보세요
"""
    static let setGoalButtonMessage = "설정 완료"
}

struct ProvisioningEnergyView: View {
    @State private var showSetGoalEnergy = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(ProvisioningEnergyDescription.allowTitle)
                .font(.ssHeading2)
                .foregroundColor(.Gray900)
                .padding(.bottom, 20)
            Text(ProvisioningEnergyDescription.allowMessage)
                .font(.ssBlackBody2)
                .foregroundColor(.Gray600)
            
            Spacer()
            
            NavigationLink {
                SetActivityGoalView()
            } label: {
                CapsuleButtonView(color: .Gray900, text: ProvisioningEnergyDescription.allowButtonMessage, size: .large)
            }
        }
        .navigationTitle("접근 허용")
        .navigationBarTitleDisplayMode(.inline)
        .padding(20)
        .background(Color.Gray200)
    }
}

struct ProvisioningEnergyView_Previews: PreviewProvider {
    static var previews: some View {
        ProvisioningEnergyView()
    }
}
