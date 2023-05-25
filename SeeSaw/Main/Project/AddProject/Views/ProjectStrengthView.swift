//
//  ProjectStrengthView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct ProjectStrengthView: View {
    @State var valueStrength: Double = 0.0
    @Binding var isStrength: Bool
    var strengthKorean: [String] = [" ", "낮아요", "보통이에요", "높아요"]
    @Binding var strength: String
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
                    .onChange(of: valueStrength) { _ in
                        isStrength = true
                        if valueStrength == 0.0 {
                            strength = "LOW"
                        } else if valueStrength == 1.0 {
                            strength = "MEDIUM"
                        } else {
                            strength = "HIGH"
                        }
                }
                    .frame(width: 300, height: 12)
                    .accentColor(.SeeSawGreen)
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
        .onAppear {
            strength = strengthKorean[Int(valueStrength)]
            if strength == "HIGH" {
                valueStrength = 3.0
            } else if strength == "MEDIUM" {
                valueStrength = 2.0
            } else if strength == "LOW" {
                valueStrength = 1.0
            }
        }
    }
}
