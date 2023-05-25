//
//  ActivityHistoryView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/20.
//

import SwiftUI

struct ActivityHistoryView: View {
    @EnvironmentObject var dateHolder: DateHolder
    @State var showEditActivityGoal: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Today")
                            .font(.ssHeading2)
                            .foregroundColor(.Gray900)
                        Spacer()
                        Button {
                            showEditActivityGoal = true
                        } label: {
                            Text("목표수정")
                                .font(.ssWhiteBody2)
                                .foregroundColor(.Gray700)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 14)
                                .background(
                                    Rectangle()
                                        .cornerRadius(90, corners: .allCorners)
                                        .foregroundColor(.Gray300))
                        }
                    }
                    .padding(.bottom, 16)
                    
                    ActivityProgressHalfCircleView(geometry: geometry)
                        .padding(.bottom, 20)
                   
                    CalendarView(context: HistoryContext.activity)
                        .environmentObject(dateHolder)
                        .padding(.horizontal, 8)
                        .padding(.bottom, 0)
                        .background(
                            Rectangle()
                                .cornerRadius(12, corners: .allCorners)
                                .foregroundColor(.Gray100))
                        .padding(.bottom, 52)
                }
            }
            .sheet(isPresented: $showEditActivityGoal) {
                if #available(iOS 16.0, *) {
                    EditEnergyGoalView(showEditActivityGoal: $showEditActivityGoal)
                        .presentationDetents([.height(400)])
                } else {
                    EditEnergyGoalView(showEditActivityGoal: $showEditActivityGoal)
                }
            }
        }
        .padding(20)
        .background(Color.Gray200)
        .navigationTitle("나의 활동량")
        .navigationBarTitleDisplayMode(.inline)
    }
}
