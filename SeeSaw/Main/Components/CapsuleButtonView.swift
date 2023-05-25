//
//  CapsuleButtonView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct CapsuleButtonView: View {
    let color: Color
    let text: String
    let size: ButtonSize
    
    enum ButtonSize {
        case large
        case middle
        case small
    }
    
    var body: some View {
        switch size {
        case .large:
            button
        case .middle:
            button.frame(width: 288)
        case .small:
            button.frame(width: 144)
        }
    }
    
    var button: some View {
        HStack {
            Spacer()
            Text(text)
            Spacer()
        }
        .font(.ssWhiteBody1)
        .foregroundColor(.Gray100)
        .frame(height: 44)
        .background(color)
        .clipShape(Capsule())
    }
}
