//
//  BatteryHistoryDetailView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import SwiftUI

struct BatteryHistoryDetailView: View {
    let data: [BatteryHistoryResponse] = [
        BatteryHistoryResponse(date: "2023-05-18",
                               activityHistory: ActivityHistory(activityAmount: 240,
                                                                activityGoal: 200,
                                                                activityBatteryVariation: -10),
                               sleepHistory: SleepHistory(sleepAmount: 4,
                                                          sleepGoal: 6,
                                                          sleepBatteryVariation: -10),
                               fastChargeHistory: FastChargeHistory(fastChargeTitle: "책 읽기",
                                                                    fastChargeValue: "여유",
                                                                    fastChargeVariation: 30)),
        BatteryHistoryResponse(date: "2023-05-17",
                               activityHistory: ActivityHistory(activityAmount: 327,
                                                                activityGoal: 200,
                                                                activityBatteryVariation: -10),
                               sleepHistory: SleepHistory(sleepAmount: 7,
                                                          sleepGoal: 6,
                                                          sleepBatteryVariation: 10),
                               fastChargeHistory: FastChargeHistory(fastChargeTitle: "엄마한테 전화하기",
                                                                    fastChargeValue: "사랑",
                                                                    fastChargeVariation: 30)),
        BatteryHistoryResponse(date: "2023-05-16",
                               activityHistory: nil,
                               sleepHistory: SleepHistory(sleepAmount: 7,
                                                          sleepGoal: 6,
                                                          sleepBatteryVariation: 10),
                               fastChargeHistory: FastChargeHistory(fastChargeTitle: "엄마한테 전화하기",
                                                                    fastChargeValue: "사랑",
                                                                    fastChargeVariation: 30)),
        BatteryHistoryResponse(date: "2023-05-15",
                               activityHistory: ActivityHistory(activityAmount: 514,
                                                                activityGoal: 200,
                                                                activityBatteryVariation: -10),
                               sleepHistory: SleepHistory(sleepAmount: 7,
                                                          sleepGoal: 6,
                                                          sleepBatteryVariation: 10),
                               fastChargeHistory: nil)]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("배터리 내역")
                    .font(.ssHeading2)
                    .foregroundColor(.Gray900)
                    .padding(.bottom, 12)
                
                ForEach(data.indices, id: \.self) { index in
                    let activityHistory = data[index].activityHistory
                    let isActivityExist = activityHistory != nil
                    let activityValue = "\(activityHistory?.activityAmount ?? 0)kcal / \(activityHistory?.activityGoal ?? 0)kcal"
                    
                    let sleepHistory = data[index].sleepHistory
                    let isSleepExist = sleepHistory != nil
                    let sleepValue = "\(sleepHistory?.sleepAmount ?? 0)시간 / \(sleepHistory?.sleepGoal ?? 0)시간"
                    
                    let fastChargeHistory = data[index].fastChargeHistory
                    let isFastChargeExist = fastChargeHistory != nil
                    
                    BatteryHistoryCardView(date: data[index].date,
                                           isActivityExist: isActivityExist,
                                           activityValue: activityValue,
                                           activityDescription: activityHistory?.activityDescription ?? "",
                                           activityVariation: activityHistory?.activityBatteryVariation ?? 200,
                                           isSleepExist: isSleepExist,
                                           sleepValue: sleepValue,
                                           sleepDescription: sleepHistory?.sleepDescription ?? "sleepDes",
                                           sleepVariation: sleepHistory?.sleepBatteryVariation ?? 200,
                                           isFastChargeExist: isFastChargeExist,
                                           fastChargeValue: fastChargeHistory?.fastChargeValue ?? "",
                                           fastChargeTitle: fastChargeHistory?.fastChargeTitle ?? "",
                                           fastChargeVariation: fastChargeHistory?.fastChargeVariation ?? 200)
                }
            }
            .padding(20)
        }
    }
}

struct BatteryHistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryHistoryDetailView()
    }
}
