//
//  ProvisioningEnergyView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/13.
//

import SwiftUI

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
