//
//  SetActivityGoalView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/16.
//

import SwiftUI

struct SetActivityGoalView: View {
    @StateObject var setGoalVM = SetGoalViewModel()
    @State var activityGoal = 200

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
                    if activityGoal > 10 {
                        activityGoal -= 10
                    }
                } label: {
                    ZStack {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.SeeSawRed)
                            .font(.system(size: 48))
                    }
                }
                
                HStack(alignment: .top, spacing: 0) {
                    Text(String(activityGoal))
                        .font(.system(size: 64))
                        .fontWeight(.bold)
                    Text("kcal")
                        .font(.ssHeading2)
                }
                .foregroundColor(.Gray900)
                
                Button {
                    if activityGoal < 3000 {
                        activityGoal += 10
                    }
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
            .simultaneousGesture(TapGesture().onEnded {
                setGoalVM.postActivityGoal(activityGoal: activityGoal)
            })
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
