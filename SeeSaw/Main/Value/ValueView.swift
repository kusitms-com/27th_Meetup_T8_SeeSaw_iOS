//
//  ValueView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/04/26.
//

import SwiftUI

struct ValueView: View {
    @AppStorage("nickname") var nickname: String = ""
    
    var valuesExistingYear: [String] = ["2023", "2022", "2021", "2020"]
    @State var valueYear: Int = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                MainToolBar(feature: .valueLog)
                
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading) {
                        Text("가치 설계도")
                            .font(.ssHeading1)
                        Text("\(nickname)님의 일과 삶의 균형을 위해")
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                            .foregroundColor(.Gray600)
                        Text("일상과 프로젝트에서 이 가치를 찾아보아요")
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                            .foregroundColor(.Gray600)
                        GifImage("ValueImage")
                            .frame(width: 350, height: 185)
                    }
                    
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 80, height: 5)
                    
                    Text("\(nickname)님의")
                        .font(.ssHeading1)
                    Text(valuesExistingYear[valueYear] + "년의 가치는")
                        .font(.ssHeading1)
                    ValueYearView(valueYear: self.valueYear)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(valuesExistingYear, id: \.self, content: {(dataItem: String) in
                                Button {
                                    valueYear = valuesExistingYear.firstIndex(of: dataItem) ?? 0
                                } label: {
                                    Text("\(dataItem)")
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
                .background(Color.Gray200)
            }
            .navigationTitle("")
        }
    }
}

struct ValueView_Previews: PreviewProvider {
    static var previews: some View {
        ValueView()
    }
}
