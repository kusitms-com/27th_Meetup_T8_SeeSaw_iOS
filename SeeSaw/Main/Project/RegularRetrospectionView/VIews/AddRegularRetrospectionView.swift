//
//  AddRegularReotrspectionView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/20.
//

import SwiftUI

struct AddRegularReotrspectionView: View {
    var todayDate: Date = Date()
    @State var todayQuestion: String = ""
    @State var todayRetrospection: String = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject var regularReviewVM = RegularReviewViewModel()
    @State var questionId: Int?
    var projectId: Int = 0
    @State var isQuestion: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TodayQuestionView(todayQuestion: $todayQuestion, questionId: $questionId, isQuestion: $isQuestion)
                ZStack {
                    TextEditor(text: $todayRetrospection)
                        .padding(10)
                        .onChange(of: todayRetrospection) { newValue in
                            if newValue.count > 500 {
                                todayRetrospection = String(newValue.prefix(500))
                            }
                        }
                        .frame(width: 350, height: 400)
                        .background(Color.white)
                        .cornerRadius(12)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("\(todayRetrospection.count)/500")
                            Spacer()
                                .frame(width: 15)
                        }
                        Spacer()
                            .frame(height: 15)
                    }
                }
                .frame(width: 350, height: 400)
                
                Text("상시 회고는 완료하면 수정이 불가능해요")
                    .font(.ssBlackBody2)
                    .foregroundColor(.Gray500)
                
                Button {
                    if !isQuestion {
                        questionId = nil
                    }
                    regularReviewVM.postRegularReview(projectId: projectId, questionId: questionId, contents: todayRetrospection)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    CapsuleButtonView(color: (todayRetrospection.count == 0 ? .Gray400 : .SeeSawGreen), text: "회고 완료", size: .large)
                }
                .disabled(todayRetrospection.count == 0)
            }
        }
        .padding(20)
        .navigationBarTitle("\(formatDate(date: todayDate))회고", displayMode: .inline)
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
    }
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M월 d일"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
