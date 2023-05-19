//
//  FastChargeCompletionView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import SwiftUI

struct FastChargeCompletionView: View {
    @AppStorage("nickname") var nickname: String = "이오링"
    @State var selectedFastChargeValue = "여유"
    
    var body: some View {
        VStack {
            checkSelectedValue
            
            Spacer()
            Button {
                
            } label: {
                CapsuleButtonView(color: .Gray900, text: "다음", size: .large)
            }
        }
        .padding(20)
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
}

struct FastChargeCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        FastChargeCompletionView()
    }
}
