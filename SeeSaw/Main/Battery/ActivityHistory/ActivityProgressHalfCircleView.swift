//
//  ActivityProgressHalfCircleView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/20.
//

import SwiftUI

struct ActivityProgressHalfCircleView: View {
    @StateObject private var batteryVM = BatteryViewModel()
    
    @State private var todayActivity: Int = 160
    @State private var activityGoal: Int = 250
    var activityRatio: Double {
        return Double(todayActivity) / Double(activityGoal)
    }
    
    let geometry: GeometryProxy
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TopHalfCircle(plusRatio: 1.0)
                .stroke(Color.BatteryMedium, style: StrokeStyle(lineWidth: 32, lineCap: .round))
            TopHalfCircle(plusRatio: activityRatio)
                .stroke(Color.BatteryHigh, style: StrokeStyle(lineWidth: 32, lineCap: .round))
            
            Text("\(todayActivity)")
                .font(.ssHeading3)
                .foregroundColor(.Gray900)
                .padding(.bottom, 16)
            
            Text("/\(activityGoal) kcal")
                .font(.ssWhiteBody2)
                .foregroundColor(.Gray900)
                .padding(.bottom, 16)
                .offset(x: 60, y: 12)
        }
        .frame(height: geometry.size.width * 0.35 + 32)
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        batteryVM.getBattery { batteryInfo in
            if let activity = batteryInfo.todayActivity, let goal = batteryInfo.activityGoal {
                todayActivity = activity
                activityGoal = goal
            }
        }
    }
}
