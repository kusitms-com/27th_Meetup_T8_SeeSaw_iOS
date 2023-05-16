//
//  SetActivityGoalView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/16.
//

import SwiftUI

struct SetActivityGoalView: View {
    @State var goalEnergy = 200
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(ProvisioningEnergyDescription.setGoalTitle)
                .font(.ssHeading2)
                .foregroundColor(.Gray900)
                .padding(.bottom, 20)
            Text(ProvisioningEnergyDescription.setGoalMessage)
                .font(.ssBlackBody2)
                .foregroundColor(.Gray600)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button {
                    goalEnergy -= 10
                } label: {
                    ZStack {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.SeeSawRed)
                            .font(.system(size: 48))
                    }
                }
                
                HStack(alignment: .top, spacing: 0) {
                    Text(String(goalEnergy))
                        .font(.system(size: 64))
                        .fontWeight(.bold)
                    Text("kcal")
                        .font(.ssHeading2)
                }
                .foregroundColor(.Gray900)
                
                Button {
                    goalEnergy += 10
                } label: {
                    ZStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.SeeSawGreen)
                            .font(.system(size: 48))
                    }
                }
                
                Spacer()
            }
                
            Spacer()
            Spacer()
            
            NavigationLink {
                BatteryDashboardView()
                    .navigationBarBackButtonHidden()
            } label: {
                CapsuleButtonView(color: .Gray900, text: ProvisioningEnergyDescription.setGoalButtonMessage, size: .large)
            }
        }
        .navigationTitle("활동량 목표 설정")
        .navigationBarTitleDisplayMode(.inline)
        .padding(20)
        .background(Color.Gray200)
    }
}

struct SetActivityGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SetActivityGoalView()
    }
}
