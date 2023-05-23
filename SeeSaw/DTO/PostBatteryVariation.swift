//
//  PostBatteryVariation.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import Foundation

struct BatteryHistoryResponse: Codable {
    let date: String
    let activityHistory: ActivityHistory?
    let sleepHistory: SleepHistory?
    let fastChargeHistory: FastChargeHistory?
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case activityHistory = "activity"
        case sleepHistory = "sleep"
        case fastChargeHistory = "charge"
    }
}

struct SleepHistory: Codable {
    let sleepAmount: Int?
    let sleepGoal: Int?
    let sleepBatteryVariation: Int?
    
    private enum CodingKeys: String, CodingKey {
        case sleepAmount = "curSleep"
        case sleepGoal = "goalSleep"
        case sleepBatteryVariation = "sleepVariation"
    }
    
    var sleepDescription: String? {
        guard let sleepAmount = sleepAmount else { return "" }
        guard let sleepGoal = sleepGoal else { return "" }
        if sleepAmount >= sleepGoal {
            return "알맞게 잤어요"
        } else if sleepAmount >= (sleepGoal / 2) {
            return "적게 잤어요"
        } else {
            return "너무 적게 잤어요"
        }
    }
}

struct FastChargeHistory: Codable {
    let fastChargeTitle: String?
    let fastChargeValue: String?
    let fastChargeVariation: Int?
    
    private enum CodingKeys: String, CodingKey {
        case fastChargeTitle = "chargeName"
        case fastChargeValue = "valueName"
        case fastChargeVariation = "chargeVariation"
    }
}

struct ActivityHistory: Codable {
    let activityAmount: Int?
    let activityGoal: Int?
    let activityBatteryVariation: Int?
    
    private enum CodingKeys: String, CodingKey {
        case activityAmount = "curActivity"
        case activityGoal = "goalActivity"
        case activityBatteryVariation = "activityVariation"
    }
    
    var activityDescription: String? {
        guard let activityAmount = activityAmount else { return "" }
        guard let activityGoal = activityGoal else { return "" }
        
        if activityAmount > activityGoal + 50 {
            return "너무 많이 움직였어요"
        } else if activityAmount >= activityGoal {
            return "알맞게 움직였어요"
        } else {
            return "적게 움직였어요"
        }
    }
}
