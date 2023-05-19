//
//  ProjectStrengthView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct ProjectStrengthView: View {
    @State var valueStrength = 0.0
    var strengthKorean: [String] = [" ", "낮아요", "보통이에요", "높아요"]
    var body: some View {
        VStack(alignment: .leading) {
            Text("프로젝트 강도는 어떻게 되나요?")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray900)
            Text(strengthKorean[Int(valueStrength)])
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray600)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 18)
                .padding(.bottom, 6)
            HStack(spacing: 140) {
                Slider(value: $valueStrength, in: 1...3, step: 1)
                    .frame(width: 300, height: 12)
           }
            .frame(maxWidth: .infinity, alignment: .center)
            HStack(spacing: 90) {
                Text("LOW")
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray600)
                Text("MEDIUM")
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray600)
                Text("HIGH")
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray600)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct ProjectStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectStrengthView()
    }
}
