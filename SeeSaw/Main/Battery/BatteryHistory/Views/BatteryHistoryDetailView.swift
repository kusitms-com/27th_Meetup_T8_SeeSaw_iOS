//
//  BatteryHistoryDetailView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import SwiftUI

struct BatteryHistoryDetailView: View {
    @State private var thirtyDaysBatteryHistory: [BatteryHistoryResponse] = []
    @StateObject private var batteryHistoryVM = BatteryHistoryViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("배터리 내역")
                    .font(.ssHeading2)
                    .foregroundColor(.Gray900)
                    .padding(.bottom, 12)
                
                ForEach(thirtyDaysBatteryHistory.indices, id: \.self) { index in
                    let activityHistory = thirtyDaysBatteryHistory[index].activityHistory
                    let isActivityExist = activityHistory?.activityBatteryVariation != nil
                    
                    let sleepHistory = thirtyDaysBatteryHistory[index].sleepHistory
                    let isSleepExist = sleepHistory?.sleepBatteryVariation != nil
                    
                    let fastChargeHistory = thirtyDaysBatteryHistory[index].fastChargeHistory
                    let isFastChargeExist = fastChargeHistory != nil
                    
                    let isAnythingExist = isActivityExist == false && isSleepExist == false && isFastChargeExist == false
                    
                    if isAnythingExist == false {
                        BatteryHistoryCardView(data: thirtyDaysBatteryHistory[index])
                    }
                }
            }
            .padding(20)
            .onAppear {
                batteryHistoryVM.getThirtyDaysBatteryHistory { batteryHistory in
                    thirtyDaysBatteryHistory = batteryHistory
                    print(thirtyDaysBatteryHistory)
                }
            }
        }
    }
}

struct BatteryHistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryHistoryDetailView()
    }
}
