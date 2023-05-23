//
//  BatteryHistoryCardRow.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import SwiftUI

struct BatteryHistoryCardRow: View {
    let title: String
    let value: String
    let description: String
    let variation: Int
    var isVariationPositive: Bool {
        return variation > 0
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Image(isVariationPositive ? "BatteryHistoryPositive" : "BatteryHistoryNegative")
                .foregroundColor(.Gray400)
                .frame(width: 56, height: 56)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.ssWhiteSubTitle)
                    .foregroundColor(.Gray700)
                
                Text(value)
                    .font(.ssBlackBody4)
                    .foregroundColor(.Gray900)
                
                Text(description)
                    .font(.ssBlackBody2)
                    .foregroundColor(.Gray900)
            }
            
            Spacer()
            
            Text("\(isVariationPositive ? "+" : "")\(variation)%p")
                .font(.ssBlackTitle2)
                .foregroundColor(isVariationPositive ? .SeeSawGreen : .SeeSawRed)
        }
    }
}
