//
//  SetSleepGoalView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/13.
//

import SwiftUI

enum SetSleepGoalDescription {
    static let title = """
드르렁...
하루 목표 수면 시간을 설정해볼까요?
"""
    static let message = """
평소의 수면 시간 또는 원하는 수준의 수면 시간을
기준으로 일일 목표를 설정해보세요.
하루 평균 6-8시간이 적당해요!
"""
}

struct SetSleepGoalView: View {
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
                
                Button {
                    sleepGoal -= 1
                } label: {
                    ZStack {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.SeeSawRed)
                            .font(.system(size: 48))
                    }
                }
                
                HStack(alignment: .top, spacing: 0) {
                    Text(String(sleepGoal))
                        .font(.system(size: 64))
                        .fontWeight(.bold)
//                    TextField("", text: $goalEnergy)
//                        .keyboardType(.numberPad)
//                        .font(.system(size: 64))
                    Text("시간")
                        .font(.ssHeading2)
                }
                .foregroundColor(.Gray900)
                
                Button {
                    sleepGoal += 1
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
            
            Button {
                
            } label: {
                NavigationLink {
                    BatteryDashboardView()
                        .navigationBarBackButtonHidden()
                } label: {
                    CapsuleButtonView(color: .Gray900, text: "설정 완료", size: .large)
                }
            }
            
        }
        .navigationTitle("접근 허용")
        .navigationBarTitleDisplayMode(.inline)
        .padding(20)
        .background(Color.Gray200)
    }
}

struct SetSleepGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SetSleepGoalView()
    }
}
