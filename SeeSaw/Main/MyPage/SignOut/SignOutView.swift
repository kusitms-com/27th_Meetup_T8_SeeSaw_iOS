//
//  SignOutView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/15.
//

import SwiftUI

struct SignOutView: View {
    @State private var nickname = "에몽"
    @State private var usedSeeSawDays = "365"
    @State private var firstValue = "가치"
    @State private var secondValue = "여유"
    @State private var thirdValue = "사랑"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("\(nickname)님은")
                .font(.ssHeading1)
            HStack {
                ValueBlockView(backgroundColor: .SeeSawGreen,
                               text: "\(usedSeeSawDays)일")
                Text("동안")
                    .font(.ssHeading1)
                
                Spacer()
            }
            ValueBlockView(backgroundColor: .SeeSawYellow,
                           text: firstValue)
            ValueBlockView(backgroundColor: .SeeSawBlue,
                           text: secondValue)
            ValueBlockView(backgroundColor: .SeeSawRed,
                           text: thirdValue)
            
            Text("를 지키기 위해 달려왔어요")
                .font(.ssHeading1)
            
            Spacer()
            
            threeChevronDown
        }
        .padding(20)
    }
    
    var threeChevronDown: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack {
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 44))
                    .foregroundColor(.SeeSawGreen).opacity(0.3)
                Spacer()
            }
            HStack {
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 44))
                    .foregroundColor(.SeeSawGreen).opacity(0.5)
                Spacer()
            }
            HStack {
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 44))
                    .foregroundColor(.SeeSawGreen).opacity(0.7)
                Spacer()
            }
        }
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
