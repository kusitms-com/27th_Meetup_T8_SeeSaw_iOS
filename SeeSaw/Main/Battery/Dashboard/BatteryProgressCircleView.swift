//
//  BatteryProgressCircleView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import SwiftUI

struct BatteryProgressCircleView: View {
    let geometry: GeometryProxy
    @Binding var battery: Int
    var batteryRate: Double {
        return Double(battery) / 100
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            ZStack {
                Circle()
                    .foregroundColor(.Gray100)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                
                Circle()
                    .stroke(
                        Color.SeeSawGreen.opacity(0.3),
                        lineWidth: 30
                    )
                    .frame(width: geometry.size.width - 72, height: geometry.size.width - 72)
                
                Circle()
                    .trim(from: 0, to: batteryRate)
                    .stroke(
                        Color.SeeSawGreen,
                        style: StrokeStyle(lineWidth: 30, lineCap: .round)
                    )
                    .frame(width: geometry.size.width - 72, height: geometry.size.width - 72)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut(duration: 1.0), value: batteryRate)
            }
            
            VStack(alignment: .center, spacing: 0) {
                ZStack {
                    Text("%")
                        .font(.ssHeading1)
                        .offset(x: 72, y: -40)
                    
                    Text("\(battery)")
                        .font(.system(size: 100))
                        .fontWeight(.semibold)
                }
                
                NavigationLink {
                    BatteryHistoryView()
                } label: {
                    HStack(spacing: 8) {
                        Text("나의 배터리 자세히 보기")
                            .font(.ssBlackBody2)
                            .foregroundColor(.Gray700)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 10))
                            .foregroundColor(.Gray400)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(
                        Rectangle()
                            .cornerRadius(12, corners: .allCorners)
                            .foregroundColor(.Gray200))
                }
            }
        }
    }
}
