//
//  ProjectRegularRetrospectionView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/20.
//

import SwiftUI

struct ProjectRegularRetrospectionView: View {
    let dataArray: [MyModel]
    var arraySize: Int
    var colorArray: [Color] = [.SeeSawRed, .SeeSawYellow, .SeeSawBlue]
    @State var isShowText: [Bool]
    @Environment(\.presentationMode) var presentationMode
    init() {
        dataArray = MyModel.DataArray
        arraySize = dataArray.count
        _isShowText = State(initialValue: Array(repeating: false, count: dataArray.count))
    }
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Text("편집")
                        .foregroundColor(.Gray700)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 28)
                        .background(Color.Gray300)
                        .cornerRadius(30)
                }
            }
            Button {
                
            } label: {
                CapsuleButtonView(color: .Gray300, text: "+", size: .large)
            }
            ScrollView {
                ForEach(Array(dataArray.enumerated()), id: \.element.value) { index, dataItem in
                    ZStack {
                        VStack {
                            HStack {
                                Text("\(dataItem.title)")
                                    .foregroundColor(.Gray900)
                                Spacer()
                                Button {
                                    withAnimation {
                                        isShowText[index].toggle()
                                    }
                                } label: {
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.Gray900)
                                }
                            }
                            Text("여기다가 상시회고 적는건데 일단 뭐라고 적어야할지 모르겠어서 그냥 노래가사 적을게요 Baby (baby), got me looking so crazy (crazy) 빠져버리는 daydream (daydream) Got me feeling you 너도 말해줄래? 누가 내게 뭐래던 남들과는 달라 넌 Maybe you could be the one ")
                                .lineLimit(isShowText[index] ? 100 : 1)
                                .foregroundColor(isShowText[index] ? .black : .Gray800)
                        }
                        .padding(20)
                        .background(colorArray[index % 3].opacity(0.32))
                        .cornerRadius(12)
                    }
                }
            }
        }
        .padding(20)
        .navigationBarTitle("상시회고", displayMode: .inline)
        .foregroundColor(.Gray500)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
        )
    }
}

struct ProjectRegularRetrospectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRegularRetrospectionView()
    }
}
