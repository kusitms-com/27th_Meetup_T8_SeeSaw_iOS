//
//  BatteryDashboardEnergyView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/22.
//

import SwiftUI

struct BatteryDashboardEnergyView: View {
    @Binding var isEnergyGoalExist: Bool
    @Binding var energyGoal: Int
    @Binding var todayEnergy: Int
    var energyRatio: Double {
        let ratio = Double(todayEnergy) / Double(energyGoal)
        return ratio < 1.0 ? ratio : 1.0
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("활동량")
                .font(.ssHeading2)
            if isEnergyGoalExist {
                NavigationLink {
                    ActivityHistoryView()
                } label: {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.Gray200)
                            .frame(height: 260)
                        
                        energyStatus
                    }
                }
            } else {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(.Gray200)
                        .frame(height: 260)

                    setEnergyGoal
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    var energyStatus: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("얼마나 움직이셨나요?")
                .font(.ssBlackBody1)
                .foregroundColor(.Gray500)
                .padding(.leading, 8)
            
            ZStack {
                RightHalfCircle(plusRatio: 1.0)
                    .stroke(Color.BatteryLow, lineWidth: 32)
                RightHalfCircle(plusRatio: energyRatio)
                    .stroke(Color.BatteryHigh, lineWidth: 32)
            }
            
            HStack {
                Spacer()
                Text("\(todayEnergy) / \(energyGoal) kcal")
                    .font(.ssWhiteBody1)
                    .foregroundColor(.GrayBlack)
                    .padding(.trailing, 8)
            }
        }
        .padding(.vertical, 16)
    }
    
    var setEnergyGoal: some View {
        ZStack(alignment: .bottom) {
            Image("SetGoalImage")
                .resizable()
            
            VStack {
                Text("활동량 목표")
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray500)
                
                NavigationLink {
                    ProvisioningEnergyView()
                } label: {
                    CapsuleButtonView(color: .Gray900,
                                      text: "설정하기",
                                      size: .small)
                }
            }
            .padding(.bottom, 12)
        }
    }
}
