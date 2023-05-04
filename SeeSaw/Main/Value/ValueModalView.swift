//
//  ValueModalView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/03.
//

import SwiftUI

struct ValueModalView: View {
    var valueTitle: String
    var valueColor: Color
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .top) {
                if valueColor == .SeeSawYellow {
                        Image("ValueModalTopYellow")
                } else if valueColor == .SeeSawBlue {
                    Image("ValueModalTopBlue")
                } else {
                    Image("ValueModalTopRed")
                }
                VStack {
                    Spacer()
                        .frame(height: 14)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 75, height: 6)
                        .foregroundColor((valueColor == .SeeSawRed ? Color.SeeSawDarkRed: (valueColor == .SeeSawBlue ? Color.SeeSawDarkBlue : Color.SeeSawDarkYellow)))
                    Spacer()
                        .frame(height: 50)
                    VStack(alignment: .leading) {
                        Text(valueTitle)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(valueColor == .SeeSawYellow ? .GrayBlack : .Gray100)
                        Text(valueTitle + "과 관련된 프로젝트와 루틴들이에요")
                            .font(.system(size: 12))
                            .foregroundColor(valueColor == .SeeSawYellow ? .Gray700 : .Gray300)
                    }
                }
            }
            Text("프로젝트")
            .frame(width: 80, height: 34)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.black)
            )
            .padding(.leading, 20)
            Rectangle()
                .frame(width: 351, height: 1)
                .padding(.leading, 20)
            Text("루틴")
            .frame(width: 80, height: 34)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.black)
            )
            .padding(.leading, 20)
            Spacer()
        }
    }
}

struct ValueModalView_Previews: PreviewProvider {
    static var previews: some View {
        ValueModalView(valueTitle: "여유", valueColor: .SeeSawBlue)
    }
}
