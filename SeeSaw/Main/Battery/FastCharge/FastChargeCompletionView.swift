//
//  FastChargeCompletionView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import SwiftUI

struct FastChargeCompletionView: View {
    @AppStorage("nickname") var nickname: String = "이오링"
    @Binding var selectedFastChargeValue: String
    @State private var showSelecteValue: Bool = true
    
    var body: some View {
        VStack {
            if showSelecteValue {
                checkSelectedValue
            } else {
                completeFastCharge
            }
            
            Spacer()
            
            if showSelecteValue {
                Button {
                    showSelecteValue = false
                } label: {
                    CapsuleButtonView(color: .Gray900, text: "다음", size: .large)
                }
            } else {
                NavigationLink {
                    SeeSawTabView(tabIndex: .battery)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    CapsuleButtonView(color: .Gray900, text: "완료", size: .large)
                }
            }
        }
        .padding(20)
        .background(Color.Gray200)
        .navigationTitle("고속충전")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var checkSelectedValue: some View {
        VStack(alignment: .leading, spacing: 16) {
            Rectangle()
                .frame(width: 80, height: 6)
                .foregroundColor(.SeeSawGreen)
            
            Text("\(nickname)님!")
            Text("오늘은")
            HStack {
                ValueBlockView(backgroundColor: .SeeSawBlue,
                               text: selectedFastChargeValue,
                               showArrow: false)
                Text("가득한")
                Spacer()
            }
            Text("하루를 보내셨군요!")
        }
        .font(.ssHeading1)
        .foregroundColor(.GrayBlack)
    }
    
    var completeFastCharge: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("배터리 충전 완료!")
                .font(.ssHeading2)
                .foregroundColor(.Gray900)
            Text("내일도 고속충전하러 오세요")
                .font(.ssBlackBody1)
            
            HStack {
                Spacer()
                GifImage("FastCharge")
                    .frame(width: 300)
                Spacer()
            }
            
            HStack {
                Spacer()
            }
        }
    }
}
