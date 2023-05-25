//
//  BatteryChartView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import SwiftUI

struct BatteryChartView: View {
    @State private var sevenDaysBatteryHistory: [BatteryHistory] = []
    @StateObject private var batteryHistoryVM = BatteryHistoryViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("배터리 수준")
                .font(.ssHeading2)
                .foregroundColor(.Gray900)
                .padding(.bottom, 12)
            
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    HStack {
                        Text("100")
                            .font(.ssBlackBody3)
                            .foregroundColor(.Gray400)
                        dashedLine
                    }
                    HStack {
                        Text("50")
                            .font(.ssBlackBody3)
                            .foregroundColor(.Gray400)
                        dashedLine
                    }
                        .padding(.vertical, 72)
                    HStack {
                        Text("0")
                            .font(.ssBlackBody3)
                            .foregroundColor(.Gray400)
                        dashedLine
                    }
                }
                
                HStack(alignment: .bottom, spacing: 16) {
                    ForEach(sevenDaysBatteryHistory.indices, id: \.self) { index in
                        let height = CGFloat((148 * sevenDaysBatteryHistory[index].batteryPercentage)) / 100
                        
                        VStack {
                            Rectangle()
                                .cornerRadius(90, corners: [.topLeft, .topRight])
                                .foregroundColor(.SeeSawYellow)
                                .frame(width: 20, height: height)
                            
                            Text(sevenDaysBatteryHistory[index].date.suffix(5))
                                .font(.ssBlackBody4)
                                .foregroundColor(.Gray400)
                        }
                        .offset(y: 11) // y축 지표 없으면 18
                    }
                }
            }
        }
        .padding(20)
        .onAppear {
            batteryHistoryVM.getSevenDaysBatteryHistory { batteryHistory in
                sevenDaysBatteryHistory = batteryHistory.reversed()
            }
        }
    }
    
    var dashedLine: some View {
        Line()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .frame(height: 1)
            .foregroundColor(.Gray300)
    }
}

struct BatteryChartView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryChartView()
    }
}
