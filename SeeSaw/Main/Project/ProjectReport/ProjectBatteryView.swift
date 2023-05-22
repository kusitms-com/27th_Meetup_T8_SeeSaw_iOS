//
//  BatteryView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectBatteryView: View {
    var progress: Double
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.Gray100)
                .frame(width: 115, height: 115)
            
            Circle()
                .stroke( // 1
                    Color.SeeSawGreen.opacity(0.3),
                    lineWidth: 16
                )
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: progress) // 1
                .stroke(
                    Color.SeeSawGreen,
                    style: StrokeStyle(
                        lineWidth: 16,
                        lineCap: .round
                    )
                )
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut(duration: 2.0), value: progress)
        }
    }
}

struct ProjectBatteryView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectBatteryView(progress: 0.5)
    }
}
