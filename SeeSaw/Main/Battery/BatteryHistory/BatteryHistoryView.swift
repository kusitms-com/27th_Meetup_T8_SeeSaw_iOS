//
//  BatteryHistoryView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/13.
//

import SwiftUI

struct BatteryHistoryView: View {
    var body: some View {
        VStack {
            BatteryChartView()
            
            Divider()
            
            BatteryHistoryDetailView()
            
        }
        .navigationTitle("나의 배터리")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.Gray200)
    }
}

struct BatteryHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryHistoryView()
    }
}
