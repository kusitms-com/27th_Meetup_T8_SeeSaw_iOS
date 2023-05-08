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
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(27, corners: .bottomRight)
                .cornerRadius(27, corners: .topRight)
                .frame(width: 184, height: 54)
                .foregroundColor(valueColor)
                .onTapGesture {
                    self.showModal = true
                }
            HStack {
                Text(valueTitle)
                    .font(.ssHeading1)
                    .font(.system(size: 32))
                    .foregroundColor(.Gray100)
                .foregroundColor(.white)
                .sheet(isPresented: self.$showModal) {
                    ValueModalView(valueTitle: self.valueTitle, valueColor: self.valueColor)
                }
                Spacer()
                    .frame(width: 85)
                Image(systemName: "arrow.up.right")
                    .foregroundColor(.Gray900)
                Spacer()
                    .frame(width: 5)
            }
        }
    }
}

struct ValueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ValueButtonView(valueTitle: "도전", valueColor: .SeeSawRed)
    }
}
