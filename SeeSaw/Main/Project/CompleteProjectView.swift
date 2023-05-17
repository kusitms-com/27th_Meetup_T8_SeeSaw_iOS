//
//  CompleteProjectView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/05.
//

import SwiftUI


struct CompleteProjectView: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.fixed(180)),
                    GridItem(.fixed(180))
                ], spacing: 10, content: {
                    ForEach(MyModel.DataArray, content: { (dataItem: MyModel) in
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main.bounds.size.width / 2 - 20, height: 200)
                                .foregroundColor(.Gray300)
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    VStack {
                                        Button {
                                            
                                        } label: {
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.white)
                                        }
                                        Spacer()
                                            .frame(height: 3)
                                        Text(dataItem.value)
                                            .font(.ssBlackTitle1)
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                        .frame(width: 100)
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "arrow.up.right")
                                            .frame(width: 28, height: 28)
                                            .foregroundColor(.Gray900)
                                            .background(.white)
                                            .cornerRadius(30)
                                            .offset(x: 0, y: -10)
                                    }
                                    
                                }
                                Spacer()
                                    .frame(height: 40)
                                Text(dataItem.title)
                                    .font(.ssBlackTitle1)
                                    .foregroundColor(.Gray900)
                                Text(dataItem.strength)
                                    .font(.ssWhiteBody3)
                                    .foregroundColor(.Gray900)
                                    .frame(width: 70, height: 18)
                                    .background(.white)
                                    .cornerRadius(30)
                                ProgressView(value: dataItem.progress)
                                    .frame(width: 150)
                                    .progressViewStyle(LinearProgressViewStyle(tint: .Gray900))
                                    .background(.white)
                                    
                            }
                        }
                    })
                })
            }
        }
    }
}

struct CompleteProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteProjectView()
    }
}
