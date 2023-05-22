//
//  PostBatteryVariation.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import Foundation

struct BatteryHistoryResponse {
    let date: String
    let activityHistory: ActivityHistory?
    let sleepHistory: SleepHistory?
    let fastChargeHistory: FastChargeHistory?
}

struct SleepHistory {
    let sleepAmount: Int
    let sleepGoal: Int
    let sleepBatteryVariation: Int
    var sleepDescription: String {
        if sleepAmount >= sleepGoal {
            return "알맞게 잤어요"
        } else if sleepAmount >= (sleepGoal / 2) {
            return "적게 잤어요"
        } else {
            return "너무 적게 잤어요"
        }
    }
}

struct FastChargeHistory {
    let fastChargeTitle: String
    let fastChargeValue: String
    let fastChargeVariation: Int
}

struct ActivityHistory {
    let activityAmount: Int
    let activityGoal: Int
    let activityBatteryVariation: Int
    var activityDescription: String {
        if activityAmount > activityGoal + 50 {
            return "너무 많이 움직였어요"
        } else if activityAmount >= activityGoal {
            return "알맞게 움직였어요"
        } else {
            return "적게 움직였어요"
        }
    }
}
