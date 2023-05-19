//
//  ActivityHistoryView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/20.
//

import SwiftUI

struct ActivityHistoryView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Today")
                    .font(.ssHeading2)
                    .foregroundColor(.Gray900)
                Spacer()
                NavigationLink {
                    
                } label: {
                    Text("목표수정")
                        .font(.ssWhiteBody2)
                        .foregroundColor(.Gray700)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 14)
                        .background(
                            Rectangle()
                                .cornerRadius(90, corners: .allCorners)
                                .foregroundColor(.Gray300))
                }
            }
        }
        .padding(20)
    }
}

struct ActivityHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityHistoryView()
    }
}
