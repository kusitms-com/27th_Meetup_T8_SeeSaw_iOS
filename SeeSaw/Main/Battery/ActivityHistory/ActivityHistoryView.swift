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
    @State var activityGoal: Int = 220
    
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
                   
                    CalendarView()
                        .environmentObject(dateHolder)
                        .padding(.horizontal, 8)
                        .padding(.bottom, 60)
                        .background(
                            Rectangle()
                                .cornerRadius(12, corners: .allCorners)
                                .foregroundColor(.Gray100))
                        .padding(.bottom, 52)
                }
            }
            .sheet(isPresented: $showEditActivityGoal) {
                if #available(iOS 16.0, *) {
                    EditEnergyGoalView(activityGoal: $activityGoal,
                                       showEditActivityGoal: $showEditActivityGoal)
                        .presentationDetents([.height(400)])
                } else {
                    EditEnergyGoalView(activityGoal: $activityGoal,
                                       showEditActivityGoal: $showEditActivityGoal)
                }
            }
        }
        .padding(20)
        .background(Color.Gray200)
        .navigationTitle("나의 활동량")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EditEnergyGoalView: View {
    @Binding var activityGoal: Int
    @Binding var showEditActivityGoal: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .cornerRadius(30, corners: .allCorners)
                .frame(width: 72, height: 6)
                .foregroundColor(.Gray300)
            
            Text("목표 활동량 수정")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray500)
                .padding(.top, 28)
            
            Divider()
                .padding(.top, 16)
            
            Spacer()
            buttonRow
            Spacer()
            
            Button {
                showEditActivityGoal = false
                // TODO: 에너지 목표 설정
            } label: {
                CapsuleButtonView(color: Color.Gray900, text: "설정 완료", size: .large)
            }
        }
        .padding(20)
    }
    
    var buttonRow: some View {
        HStack {
            Spacer()
            
            Button {
                activityGoal -= 10
            } label: {
                ZStack {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.SeeSawRed)
                        .font(.system(size: 48))
                }
            }
            
            HStack(alignment: .top, spacing: 0) {
                Text(String(activityGoal))
                    .font(.system(size: 64))
                    .fontWeight(.bold)
                Text("kcal")
                    .font(.ssHeading2)
            }
            .foregroundColor(.Gray900)
            
            Button {
                activityGoal += 10
            } label: {
                ZStack {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.SeeSawGreen)
                        .font(.system(size: 48))
                }
            }
            
            Spacer()
        }
    }
}
