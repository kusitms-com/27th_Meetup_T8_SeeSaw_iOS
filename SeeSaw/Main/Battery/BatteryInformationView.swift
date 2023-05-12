//
//  BatteryInformationView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/12.
//

import SwiftUI

enum BatteryInformation {
    static let battery = """
설정한 가치를 실천하면 충전돼요
수면시간이 충분하면 충전돼요

수면시간이 부족하면 방전돼요
너무 많이 움직이면 방전돼요
"""
    static let recommend = """
매일매일 사소한 것이라도 좋아요!
자신의 가치를 실현해보세요

푹 자면서 피로를 회복해보세요

너무 많이 움직인 다음 날은 조금 쉬어볼까요?
"""
}

struct BatteryInformationView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("배터리는..")
                    .font(.ssHeading2)
                Text(BatteryInformation.battery)
                    .font(.ssBlackBody1)
                HStack {
                    Spacer()
                }
            }
            .foregroundColor(.Gray900)
            .padding(.vertical, 20)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("너도 0%가 되지 않게 조심해!")
                    .font(.ssHeading2)
                Text(BatteryInformation.recommend)
                    .font(.ssBlackBody1)
                HStack {
                    Spacer()
                }
            }
            .foregroundColor(.Gray900)
        }
        .padding(.horizontal, 20)
    }
}

struct BatteryInformationView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryInformationView()
    }
}
