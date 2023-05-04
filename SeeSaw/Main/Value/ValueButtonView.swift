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
                .cornerRadius(24, corners: .bottomRight)
                .cornerRadius(24, corners: .topRight)
                .frame(width: 240, height: 68)
                .foregroundColor(valueColor)
            HStack{
                Button {
                    self.showModal = true
                } label: {
                    Text(valueTitle)
                        .font(.title)
                        .bold()
                }
                .foregroundColor(.white)
                .sheet(isPresented: self.$showModal){
                    ValueModalView(valueTitle: self.valueTitle, valueColor: self.valueColor)
                }
                Spacer()
                    .frame(width: 130)
                Image(systemName: "arrow.up.right")
            }
        }
    }
}

struct ValueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ValueButtonView(valueTitle: "도전", valueColor: .red)
    }
}
