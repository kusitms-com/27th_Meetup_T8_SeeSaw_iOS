//
//  ShowValuesView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/15.
//

import SwiftUI

struct ShowValuesView: View {
    @State private var nickname = "에몽"
    @State private var usedSeeSawDays = "365"
    @State private var firstValue = "가치"
    @State private var secondValue = "여유"
    @State private var thirdValue = "사랑"
    
    @State private var showSignOutView = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("\(nickname)님은")
                .font(.ssHeading1)
            HStack {
                ValueBlockView(backgroundColor: .SeeSawGreen,
                               text: "\(usedSeeSawDays)일",
                               showArrow: false)
                Text("동안")
                    .font(.ssHeading1)
                
                Spacer()
            }
            .opacity(showSignOutView ? 1 : 0)
            .animation(.easeInOut(duration: 1.0), value: showSignOutView)
            
            ValueBlockView(backgroundColor: .SeeSawYellow,
                           text: firstValue,
                           showArrow: false)
                .opacity(showSignOutView ? 1 : 0)
                .animation(.easeInOut(duration: 1.0).delay(0.6), value: showSignOutView)
            
            ValueBlockView(backgroundColor: .SeeSawBlue,
                           text: secondValue,
                           showArrow: false)
                .opacity(showSignOutView ? 1 : 0)
                .animation(.easeInOut(duration: 1.0).delay(1.6), value: showSignOutView)
            
            ValueBlockView(backgroundColor: .SeeSawRed,
                           text: thirdValue,
                           showArrow: false)
                .opacity(showSignOutView ? 1 : 0)
                .animation(.easeInOut(duration: 1.0).delay(2.6), value: showSignOutView)
            
            Text("를 지키기 위해 달려왔어요")
                .font(.ssHeading1)
                .opacity(showSignOutView ? 1 : 0)
                .animation(.easeInOut(duration: 1.0).delay(3.6), value: showSignOutView)
            
            Spacer()
            
            threeChevronDown
                .opacity(showSignOutView ? 1 : 0)
                .animation(.easeInOut(duration: 1.0).delay(4.6), value: showSignOutView)
        }
        .padding(20)
        .onAppear {
            showSignOutView = true
        }
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

struct ShowValuesView_Previews: PreviewProvider {
    static var previews: some View {
        ShowValuesView()
    }
}
