//
//  BatteryHistoryCardView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import SwiftUI

struct BatteryHistoryCardView: View {
    let date: String
    
    let isActivityExist: Bool
    let activityValue: String
    let activityDescription: String
    let activityVariation: Int
    
    let isSleepExist: Bool
    let sleepValue: String
    let sleepDescription: String
    let sleepVariation: Int
    
    let isFastChargeExist: Bool
    let fastChargeValue: String
    let fastChargeTitle: String
    let fastChargeVariation: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(date)
            
            if isActivityExist {
                BatteryHistoryCardRow(title: "활동량",
                                      value: activityValue,
                                      description: activityDescription,
                                      variation: activityVariation)
            }
            
            if isSleepExist {
                BatteryHistoryCardRow(title: "수면",
                                      value: sleepValue,
                                      description: sleepDescription,
                                      variation: sleepVariation)
            }
            
            if isFastChargeExist {
                BatteryHistoryCardRow(title: "고속충전",
                                      value: fastChargeValue,
                                      description: fastChargeTitle,
                                      variation: fastChargeVariation)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
        .background {
            Rectangle()
                .cornerRadius(12, corners: .allCorners)
                .foregroundColor(.Gray100)
        }
    }
}
