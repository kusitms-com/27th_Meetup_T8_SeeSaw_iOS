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
        VStack (alignment: .leading){
            ZStack(alignment: .top) {
                Rectangle()
                    .cornerRadius(225, corners: .bottomRight)
                    .cornerRadius(225, corners: .bottomLeft)
                    .frame(width: 400, height: 225)
                    .foregroundColor(valueColor)
                VStack {
                    Spacer()
                        .frame(height: 14)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width:75,height: 6)
                        .foregroundColor(valueColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                        )
                        .foregroundColor(.black)
                            .opacity(0.5)
                    Spacer()
                        .frame(height: 50)
                    VStack(alignment: .leading) {
                        Text(valueTitle)
                            .font(.system(size: 40,weight: .bold))
                        Text(valueTitle+"과 관련된 프로젝트와 루틴들이에요")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }
            }
            Text("프로젝트")
            .frame(width:80, height: 34)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.black)
            )
            .padding(.leading, 20)
            Rectangle()
                .frame(width:351,height:1)
                .padding(.leading, 20)
            Text("루틴")
            .frame(width:80, height: 34)
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
        ValueModalView(valueTitle: "여유", valueColor: .blue)
    }
}
