//
//  SetSleepGoalView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/13.
//

import SwiftUI

enum SetSleepGoalDescription {
    static let title = "하루 목표 수면 시간을 설정해볼까요?"
    static let message = """
평소의 수면시간 또는
원하는 수준의 수면시간을 기준으로
일일 목표를 설정해보세요
"""
}

struct SetSleepGoalView: View {
    @StateObject var setGoalVM = SetGoalViewModel()
    @State var sleepGoal: Int = 6
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(SetSleepGoalDescription.title)
                .font(.ssHeading2)
                .foregroundColor(.Gray900)
                .padding(.bottom, 20)
            Text(SetSleepGoalDescription.message)
                .font(.ssBlackBody2)
                .foregroundColor(.Gray600)
            
            Spacer()
            
            HStack {
                Spacer()
                
                minusOneHourButton
                sleepGoalHour
                plusOneHourButton
                
                Spacer()
            }
                
            Spacer()
            Spacer()
            
            Button {
                setGoalVM.postSleepGoal()
                print("wow")
            } label: {
                CapsuleButtonView(color: .Gray900, text: "설정 완료", size: .large)
            }
            
            /*
             NavigationLink {
                 BatteryDashboardView()
                     .navigationBarBackButtonHidden()
             } label: {
                 
             }
             */
            
        }
        .navigationTitle("수면시간 목표 설정")
        .navigationBarTitleDisplayMode(.inline)
        .padding(20)
        .background(Color.Gray200)
    }
    
    var minusOneHourButton: some View {
        Button {
            sleepGoal -= 1
        } label: {
            ZStack {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.SeeSawRed)
                    .font(.system(size: 48))
            }
        }
    }
    
    var plusOneHourButton: some View {
        Button {
            sleepGoal += 1
        } label: {
            ZStack {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.SeeSawGreen)
                    .font(.system(size: 48))
            }
        }
    }
    
    var sleepGoalHour: some View {
        HStack(spacing: 0) {
            Text(String(sleepGoal))
                .font(.system(size: 64))
                .fontWeight(.bold)
            Text("시간")
                .font(.ssHeading2)
        }
        .foregroundColor(.Gray900)
        .padding(.horizontal, 32)
    }
}

struct SetSleepGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SetSleepGoalView()
    }
}
