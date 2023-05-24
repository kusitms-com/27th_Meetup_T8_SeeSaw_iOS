//
//  ValueYearView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/07.
//

import SwiftUI

struct ValueYearView: View {
    var valueYear: [String: Int] = [:]
    let colors: [Color] = [Color.SeeSawYellow, Color.SeeSawBlue, Color.SeeSawRed]
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(Array(valueYear.values).indices, id: \.self) { index in
                ValueButtonView(valueTitle: Array(valueYear.keys)[index], valueColor: colors[index], valueId: Array(valueYear.values)[index])
            }
        }
    }
}

//struct ValueYearView_Previews: PreviewProvider {
//    static var previews: some View {
//        ValueYearView(valueYear: [0: "도전", 1: "여유", 2: "균형"])
//    }
//}
