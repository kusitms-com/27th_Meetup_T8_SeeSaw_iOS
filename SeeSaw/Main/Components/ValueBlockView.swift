//
//  ValueBlockView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/09.
//

import SwiftUI

struct ValueBlockView: View {
    let backgroundColor: Color
    let text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .cornerRadius(100, corners: [.topRight, .bottomRight])
                .foregroundColor(backgroundColor)
            HStack {
                Text(text)
                    .font(.ssHeading1)
                    .foregroundColor(Color.Gray100)
                Spacer()
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 24))
                    .padding(.trailing, 10)
            }
            .padding(10)
        }
        .frame(width: 240, height: 54)
    }
}
