//
//  BatteryDashboardSleepView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/22.
//

import SwiftUI

struct BatteryDashboardSleepView: View {
    @Binding var isSleepGoalExist: Bool
    @Binding var todaySleepAmount: Int
    @Binding var isTodaySleepAmountExist: Bool
    @Binding var sleepCondition: String
    enum SleepDescription {
        static let GoodIcon = "SleepGood"
        static let GoodDescription = "알맞게 잤어요"
        static let BadIcon = "SleepBad"
        static let BadDescription = "적게 잤어요"
        static let TerribleIcon = "SleepTerrible"
        static let TerribleDescription = "너무 적게 잤어요"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("수면")
                .font(.ssHeading2)
            
            if isTodaySleepAmountExist {
                NavigationLink {
                    SleepHistoryView()
                } label: {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.Gray200)
                            .frame(height: 260)
                        
                        sleepStatus
                    }
                }
            } else {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(.Gray200)
                        .frame(height: 260)
                    if isSleepGoalExist {
                        setTodaySleepAmount
                    } else {
                        setSleepGoal
                    }
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    var sleepStatus: some View {
        VStack(alignment: .center, spacing: 12) {
            HStack {
                Text("얼마나 주무셨나요?")
                Spacer()
            }
            .font(.ssBlackBody1)
            .foregroundColor(.Gray500)
            .padding(.leading, 8)
            
            Spacer()
            
            Text("\(todaySleepAmount)시간")
                .font(.ssHeading1)
                .foregroundColor(.Gray900)
            
            if sleepCondition == "Good" {
                Image("\(SleepDescription.GoodIcon)")
                    .resizable()
                    .frame(width: 72, height: 64)
                
                Spacer()
                
                Text(SleepDescription.GoodDescription)
                    .font(.ssWhiteBody1)
                    .foregroundColor(.GrayBlack)
                    .padding(.trailing, 8)
            } else if sleepCondition == "Bad" {
                Image("\(SleepDescription.BadIcon)")
                    .resizable()
                    .frame(width: 72, height: 64)
                
                Spacer()
                
                Text(SleepDescription.BadDescription)
                    .font(.ssWhiteBody1)
                    .foregroundColor(.GrayBlack)
                    .padding(.trailing, 8)
            } else {
                Image("\(SleepDescription.TerribleIcon)")
                    .resizable()
                    .frame(width: 72, height: 64)
                
                Spacer()
                
                Text(SleepDescription.TerribleDescription)
                    .font(.ssWhiteBody1)
                    .foregroundColor(.GrayBlack)
                    .padding(.trailing, 8)
            }
        }
        .padding(.vertical, 16)
    }
    
    var setTodaySleepAmount: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Text("얼마나 주무셨나요?")
                Spacer()
            }
            .font(.ssBlackBody1)
            .foregroundColor(.Gray500)
            .padding(.leading, 8)
            
            Spacer()
            
            Text("\(todaySleepAmount)시간")
                .font(.ssHeading1)
                .foregroundColor(.Gray400)
                
            HStack {
                Button {
                    if todaySleepAmount > 0 {
                        todaySleepAmount -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.SeeSawRed)
                }
                Button {
                    if todaySleepAmount < 18 {
                        todaySleepAmount += 1
                    }
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.SeeSawGreen)
                }
            }
            
            Spacer()
            
            Button {
                isTodaySleepAmountExist = true
            } label: {
                CapsuleButtonView(color: .Gray900, text: "입력 완료", size: .large)
                    .padding(.horizontal, 12)
            }
        }
        .padding(.vertical, 16)
    }
    
    var setSleepGoal: some View {
        ZStack(alignment: .bottom) {
            Image("SetSleepGoalImage")
                .resizable()
            
            VStack {
                Text("수면시간 목표")
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray500)
                NavigationLink {
                    SetSleepGoalView()
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
