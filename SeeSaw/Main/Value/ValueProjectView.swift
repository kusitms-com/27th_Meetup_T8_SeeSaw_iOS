//
//  ValueProjectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/17.
//

import SwiftUI

struct ValueProjectView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(MyModel.DataArray, content: { (dataItem: MyModel) in
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 350, height: 35)
                            .foregroundColor(.white)
                        HStack {
                            Text(dataItem.title)
                            Spacer()
                            ValueProgressView(value: Double(dataItem.progress), backColor: .Gray300, foreColor: .black)
                                .frame(width: 160, height: 12)
                        }
                        .padding(.leading, 30)
                        .padding(.trailing, 25)
                    }
                    .padding(.leading, 12)
                    .padding(.trailing, 12)
                })
            }
        }
    }
}

struct ValueProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ValueProjectView()
    }
}
