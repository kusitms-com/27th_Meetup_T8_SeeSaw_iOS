//
//  ValueView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/04/26.
//

import SwiftUI

struct ValueView: View {
    @AppStorage("nickname") var nickname: String = "에몽"
    @State var valuesExistingYear: [Int] = [2020, 2021]
    @State var valueYear: Int = 0
    @StateObject var api = ApiClient()
    @StateObject var valueVM = ValueViewModel()
    @State private var values: [String: Int] = [:]
    var body: some View {
        VStack(spacing: 0) {
            MainToolBar(feature: .valueLog)
            
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Spacer()
                    }
                    Text("가치 설계도")
                        .font(.ssHeading1)
                        .padding(.bottom, 8)
                    Text("\(nickname)님의 일과 삶의 균형을 위해")
                        .fontWeight(.medium)
                        .font(.system(size: 14))
                        .foregroundColor(.Gray600)
                        .padding(.bottom, 4)
                    Text("일상과 프로젝트에서 이 가치를 찾아보아요")
                        .fontWeight(.medium)
                        .font(.system(size: 14))
                        .foregroundColor(.Gray600)
                }
            }
            .padding(.horizontal, 20)
            
            GifImage("ValueImage")
                .frame(height: 185)

//                Rectangle()
//                    .foregroundColor(.green)
//                    .frame(width: 80, height: 5)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(nickname)님의")
                    .font(.ssHeading1)
                
                Text("\(formattedNumber(valuesExistingYear[valueYear]))년의 가치는")
                    .font(.ssHeading1)
                    .padding(.bottom, 4)
                
                ValueYearView(valueYear: self.values)
                    .padding(.bottom, 16)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(valuesExistingYear, id: \.self, content: {(dataItem: Int) in
                            Button {
                                valueYear = valuesExistingYear.firstIndex(of: dataItem) ?? 0
                                api.getValuesWithValueId(year: valuesExistingYear[valueYear]) { thisYearValues in
                                    values = thisYearValues
                                }
                            } label: {
                                Text("\(formattedNumber(dataItem))")
                                    .foregroundColor(valuesExistingYear[valueYear] == dataItem ? .white : .Gray400)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(valuesExistingYear[valueYear] == dataItem ? Color.SeeSawGreen : Color.Gray300)
                                    .cornerRadius(30)
                            }
                            
                        })
                    }
                }
                
                Spacer()
            }
            .padding(20)
        }
        .background(Color.Gray200)
        .navigationTitle("")
        .onAppear {
            valueVM.getValueYear { years in
                valuesExistingYear = years.reversed()
                api.getValuesWithValueId(year: valuesExistingYear[valueYear]) { thisYearValues in
                    values = thisYearValues
                }
            }
        }
    }
    func formattedNumber(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ""
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
}

struct ValueView_Previews: PreviewProvider {
    static var previews: some View {
        ValueView()
    }
}
