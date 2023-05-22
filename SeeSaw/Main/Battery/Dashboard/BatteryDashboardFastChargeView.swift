//
//  BatteryDashboardFastChargeView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/22.
//

import SwiftUI

struct BatteryDashboardFastChargeView: View {
    @Binding var isFastChargeExist: Bool
    @Binding var fastChargeTitle: String
    @Binding var fastChargeValue: String
    @Binding var showFastChargeExistPopUp: Bool
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                HalfCircle()
                    .fill()
                    .aspectRatio(2.0, contentMode: .fit)
                    .foregroundColor(.Gray100)
                
                HStack {
                    Text("고속충전")
                        .font(.ssHeading2)
                        .foregroundColor(.Gray900)
                        .padding(.leading, 20)
                        .padding(.top, 28)
                    
                    Spacer()
                }
            }
            
            if isFastChargeExist {
                Button {
                    showFastChargeExistPopUp = true
                } label: {
                    fastChargeStatus
                }
            } else {
                fastChargeButton
            }
        }
    }
    
    // 고속충전 현황
    var fastChargeStatus: some View {
        VStack(spacing: 0) {
            Image("FastChargeCheck")
                .padding(.bottom, 12)
            Text(fastChargeTitle)
                .font(.ssWhiteBody2)
                .foregroundColor(.Gray600)
                .padding(.bottom, 4)
            HStack {
                Text(fastChargeValue)
                    .foregroundColor(.SeeSawBlue)
                Text("가득한 하루!")
                    .foregroundColor(.Gray900)
            }
            .font(.ssWhiteTitle1)
        }
    }
    
    // 고속충전 추가 버튼
    var fastChargeButton: some View {
        VStack {
            VStack {
                Text("오늘 고속충전을 하지 않았어요")
                Text("지금 하러 가볼까요?")
            }
            .font(.ssBlackBody2)
            
            NavigationLink {
                FastChargeView()
            } label: {
                CapsuleButtonView(color: .Gray900,
                                  text: "고속충전하기",
                                  size: .small)
            }
        }
    }
}
