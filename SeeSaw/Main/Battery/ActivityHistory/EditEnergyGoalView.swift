//
//  EditEnergyGoalView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/22.
//

import SwiftUI

struct EditEnergyGoalView: View {
    @StateObject private var setGoalVM = SetGoalViewModel()
    @StateObject private var batteryVM = BatteryViewModel()
    
    @State var activityGoal: Int = 0
    @Binding var showEditActivityGoal: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .cornerRadius(30, corners: .allCorners)
                .frame(width: 72, height: 6)
                .foregroundColor(.Gray300)
            
            Text("목표 활동량 수정")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray500)
                .padding(.top, 28)
            
            Divider()
                .padding(.top, 16)
            
            Spacer()
            buttonRow
            Spacer()
            
            Button {
                showEditActivityGoal = false
                setGoalVM.postActivityGoal(activityGoal: activityGoal)
            } label: {
                CapsuleButtonView(color: Color.Gray900, text: "설정 완료", size: .large)
            }
        }
        .padding(20)
        .onAppear {
            fetchData()
        }
    }
    
    var buttonRow: some View {
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
    }
    
    func fetchData() {
        batteryVM.getBattery { batteryInfo in
            if let goal = batteryInfo.activityGoal {
                activityGoal = goal
            }
        }
    }
}
