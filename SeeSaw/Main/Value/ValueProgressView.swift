//
//  ValueProgressView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/17.
//

import SwiftUI

struct ValueProgressView: View {
    var value: Double
    var backColor: Color
    var foreColor: Color
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(backColor)
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(foreColor)
            }
        }
    }
}

struct ValueProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ValueProgressView(value: 0.7, backColor: .Gray300, foreColor: .black)
    }
}
