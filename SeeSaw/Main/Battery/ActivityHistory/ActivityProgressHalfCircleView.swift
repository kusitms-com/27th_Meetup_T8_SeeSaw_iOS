//
//  ActivityProgressHalfCircleView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/20.
//

import SwiftUI

struct ActivityProgressHalfCircleView: View {
    @State private var todayActivity: Int = 160
    @State private var activityGoal: Int = 250
    var activityRatio: Double {
        return Double(todayActivity) / Double(activityGoal)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                TopHalfCircle(plusRatio: 1.0)
                    .stroke(Color.BatteryLow, style: StrokeStyle(lineWidth: 32, lineCap: .round))
                TopHalfCircle(plusRatio: 0.6)
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
            .frame(height: geometry.size.width * 0.3 + 32)
        }
    }
}

struct ActivityProgressHalfCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityProgressHalfCircleView()
    }
}
