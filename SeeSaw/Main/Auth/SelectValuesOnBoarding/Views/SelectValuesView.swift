//
//  SelectValuesView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/16.
//

import SwiftUI

struct SelectValuesView: View {
    @State private var nickname = "에몽"
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 16) {
                HStack {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .cornerRadius(90, corners: [.topRight, .bottomRight])
                            .frame(width: 360, height: 92)
                            .foregroundColor(.GrayWhite)
                        VStack(alignment: .leading) {
                            Text("\(nickname)님에게 중요한")
                                .foregroundColor(.GrayBlack)
                            HStack(spacing: 0) {
                                Text("올해의 가치 3가지")
                                    .foregroundColor(.SeeSawGreen)
                                Text("는 무엇인가요?")
                                    .foregroundColor(.GrayBlack)
                            }
                        }
                        .font(.ssBlackTitle1)
                        .padding(.leading, 20)
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Rectangle()
                        .cornerRadius(90, corners: [.topLeft, .bottomLeft])
                        .frame(width: 360, height: 92)
                        .foregroundColor(.GrayWhite)
                }
            }
            .padding(.vertical, 30)
        }
        .background(Color.Gray200)
    }
}

struct SelectValuesView_Previews: PreviewProvider {
    static var previews: some View {
        SelectValuesView()
    }
}
