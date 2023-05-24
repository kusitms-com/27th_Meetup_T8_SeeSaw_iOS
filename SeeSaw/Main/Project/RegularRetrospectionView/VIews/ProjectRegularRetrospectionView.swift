//
//  ProjectRegularRetrospectionView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/20.
//

import SwiftUI

struct ProjectRegularRetrospectionView: View {
    var colorArray: [Color] = [.SeeSawRed, .SeeSawYellow, .SeeSawBlue]
    var projectId: Int = 0
    @State var isShowText: [Bool] =  Array(repeating: false, count: 100)
    @StateObject var regularReviewVM = RegularReviewViewModel()
    @State var regularReview: [RegularReview] = []
    @Environment(\.presentationMode) var presentationMode
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
            NavigationLink(destination: AddRegularReotrspectionView()) {
                CapsuleButtonView(color: .Gray300, text: "+", size: .large)
            }
            ScrollView {
                ForEach(Array(regularReview.enumerated()), id: \.element.recordId) { index, review in
                    ZStack {
                        VStack {
                            HStack {
                                Text("\(review.createdAt)")
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
                            Text(review.contents)
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
        .background(Color.Gray200)
        .onAppear {
            regularReviewVM.getRegularReview(projectId: projectId) { review in
                regularReview = review
            }
        }
    }
}

struct ProjectRegularRetrospectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRegularRetrospectionView()
    }
}
