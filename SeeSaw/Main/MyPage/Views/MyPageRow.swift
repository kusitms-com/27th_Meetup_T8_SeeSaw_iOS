//
//  MyPageRow.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/10.
//

import SwiftUI

struct MyPageRow: View {
    let isRowTop: Bool
    let title: String
    let isChevronExist: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 40)
                .cornerRadius(10, corners: isRowTop ? [.topLeft, .topRight] : [.bottomLeft, .bottomRight])
                .foregroundColor(Color.Gray100)
                .padding(0)
            
            HStack {
                Text(title)
                Spacer()
                if isChevronExist { Image(systemName: "chevron.right") }
            }
            .font(.ssBlackBody2)
            .foregroundColor(.black)
            .padding(.horizontal, 10)
        }
    }
}
