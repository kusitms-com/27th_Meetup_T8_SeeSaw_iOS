//
//  ValueButtonView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/01.
//

import SwiftUI

struct ValueButtonView: View {
    var valueTitle: String
    var valueColor: Color
    @State private var showModal = false
    var valueId: Int = 0
    var body: some View {
        ZStack {
            Button {
                self.showModal = true
            } label: {
                Rectangle()
                    .cornerRadius(27, corners: [.bottomRight, .topRight])
                    .frame(width: 232, height: 54)
                    .foregroundColor(valueColor)
            }
                
            HStack {
                Spacer()
                    .frame(width: 8)
                Text(valueTitle)
                    .font(.ssHeading1)
                    .foregroundColor(.Gray100)
                Spacer()
                Image(systemName: "arrow.up.right")
                    .foregroundColor(.Gray900)
                Spacer()
                    .frame(width: 20)
            }
            .frame(width: 232)
        }
        .halfSheet(showSheet: self.$showModal) {
            ValueModalView(valueTitle: self.valueTitle, valueColor: self.valueColor, valueId: self.valueId)
        } onEnd: {
            print("onend")
        }
    }
}

struct ValueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ValueButtonView(valueTitle: "도전", valueColor: .SeeSawRed)
    }
}
