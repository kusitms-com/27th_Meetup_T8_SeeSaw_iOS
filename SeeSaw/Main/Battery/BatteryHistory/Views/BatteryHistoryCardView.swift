//
//  BatteryHistoryCardView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import SwiftUI

struct BatteryHistoryCardView: View {
    let data: BatteryHistoryResponse
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(data.date)
            
            if let activity = data.activityHistory, let variation = activity.activityBatteryVariation {
                let value = "\(activity.activityAmount ?? 9999)kcal / \(activity.activityGoal ?? 9998)kcal"
                
                BatteryHistoryCardRow(title: "활동량",
                                      value: value,
                                      description: activity.activityDescription ?? "값이 없어여",
                                      variation: variation)
            }
            
            if let sleep = data.sleepHistory, let variation = sleep.sleepBatteryVariation {
                let value = "\(sleep.sleepAmount ?? 8888)시간 / \(sleep.sleepGoal ?? 8887)시간"
                
                BatteryHistoryCardRow(title: "수면",
                                      value: value,
                                      description: sleep.sleepDescription ?? "값이 어여",
                                      variation: variation)
            }
            
            if let charge = data.fastChargeHistory {
                BatteryHistoryCardRow(title: "고속충전",
                                      value: charge.fastChargeValue ?? "7777",
                                      description: charge.fastChargeTitle ?? "7776",
                                      variation: charge.fastChargeVariation ?? 7766)
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
