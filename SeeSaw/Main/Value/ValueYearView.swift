//
//  ValueYearView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/07.
//

import SwiftUI

struct ValueYearView: View {
    var valueYear: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            ValueButtonView(valueTitle: "도전", valueColor: .SeeSawRed)
            ValueButtonView(valueTitle: "사랑", valueColor: .SeeSawYellow)
            HStack {
                ValueButtonView(valueTitle: "여유", valueColor: .SeeSawBlue)
                Text("이에요")
                    .font(.ssHeading1)
                    .padding(.leading, 8)
            }
        }
    }
}

struct ValueYearView_Previews: PreviewProvider {
    static var previews: some View {
        ValueYearView(valueYear: 0)
    }
}
