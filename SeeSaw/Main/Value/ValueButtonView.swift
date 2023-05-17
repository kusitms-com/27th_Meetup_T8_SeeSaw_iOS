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
                .cornerRadius(27, corners: [.bottomRight, .topRight])
                .frame(width: 184, height: 54)
                .foregroundColor(valueColor)
                .onTapGesture {
                    self.showModal = true
                }
                .sheet(isPresented: self.$showModal) {
                    ValueModalView(valueTitle: self.valueTitle, valueColor: self.valueColor)
                        .frame(height: UIScreen.main.bounds.size.height / 2)
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
            .frame(width: 184)
        }
    }
}

struct ValueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ValueButtonView(valueTitle: "도전", valueColor: .SeeSawRed)
    }
}
