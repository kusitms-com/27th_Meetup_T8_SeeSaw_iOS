//
//  ValueView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/04/26.
//

import SwiftUI

struct ValueView: View {
    var year: [String] = ["2020", "2021", "2022", "2023"]
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Text("가치 설계 View")
                Image("KakaoLoginButton")
            }
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 80, height: 5)
            Text("에몽님의")
                .font(.system(size: 36))
            Text("2023년의 가치는")
                .font(.system(size: 36))
            ValueButtonView(valueTitle: "도전", valueColor: .SeeSawRed)
            ValueButtonView(valueTitle: "사랑", valueColor: .SeeSawYellow)
            HStack {
                ValueButtonView(valueTitle: "여유", valueColor: .SeeSawBlue)
                Text("이에요")
                    .font(.system(size: 36))
            }
            HStack {
                ForEach(year, id: \.self, content: {(dataItem: String) in
                    Button(dataItem) {
                        
                    }
                    .foregroundColor(.Gray600)
                    .frame(width: 56, height: 25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.Gray600)
                    )
                })
            }
        }
    }
}

struct ValueView_Previews: PreviewProvider {
    static var previews: some View {
        ValueView()
    }
}
