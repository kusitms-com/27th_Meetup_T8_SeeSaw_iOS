//
//  ValueQuickChargeView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/17.
//

import SwiftUI

struct ValueQuickChargeView: View {
    var valueTitle: String
    var valueColor: Color
    var chargeNum: Int
    var body: some View {
        VStack {
            HStack {
                Text("고속충전으로 \(valueTitle)의 가치를 이만큼 찾았어요")
                    .font(.ssWhiteBody3)
                    .foregroundColor(valueColor == .SeeSawYellow ? .Gray700 : .Gray300)
                    Spacer()
            }
            .padding(.horizontal, 20)
            Spacer()
                .frame(height: 40)
            HStack(spacing: 1) {
                Text("\(chargeNum)")
                    .font(.custom("AppleSDGothicNeo-Regular", size: 96))
                    .fontWeight(.heavy)
                    .baselineOffset(35)
                Text("번")
                    .font(.ssBlackTitle1)
                    .foregroundColor(.Gray800)
            }
            Spacer()
        }
    }
}

struct ValueQuickChargeView_Previews: PreviewProvider {
    static var previews: some View {
        ValueQuickChargeView(valueTitle: "도전", valueColor: .SeeSawBlue, chargeNum: 2)
    }
}
