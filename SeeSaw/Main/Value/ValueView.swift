//
//  ValueView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/04/26.
//

import SwiftUI

struct ValueView: View {
    var valuesExistingYear: [String] = ["2023", "2022", "2021", "2020"]
    @State var valueYear: Int = 0
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("가치 설계도")
                    .font(.ssHeading1)
                Rectangle()
                    .frame(width: 350, height: 185)
            }
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 80, height: 5)
            Text("에몽님의")
                .font(.ssHeading1)
            Text(valuesExistingYear[valueYear] + "년의 가치는")
                .font(.ssHeading1)
            ValueYearView(valueYear: self.valueYear)
            HStack {
                ForEach(valuesExistingYear, id: \.self, content: {(dataItem: String) in
                    Button(dataItem) {
                        valueYear = valuesExistingYear.firstIndex(of: dataItem) ?? 0
                    }
                    .foregroundColor(valuesExistingYear[valueYear] == dataItem ? .SeeSawGreen : .Gray600)
                    .frame(width: 56, height: 25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundColor(valuesExistingYear[valueYear] == dataItem ? .SeeSawGreen : .Gray600)
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
