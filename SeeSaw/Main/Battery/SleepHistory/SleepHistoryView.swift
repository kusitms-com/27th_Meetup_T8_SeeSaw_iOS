//
//  SleepHistoryView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/22.
//

import SwiftUI

struct SleepHistoryView: View {
    @EnvironmentObject var dateHolder: DateHolder
    @State var showEditSleepGoal: Bool = false
    @State var sleepGoal: Int = 5
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Text("Today")
                        .font(.ssHeading2)
                        .foregroundColor(.Gray900)
                    Spacer()
                    Button {
                        showEditSleepGoal = true
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
                
                VStack {
                    Image("SleepGood")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100)
                    
                    Text("5시간")
                        .font(.ssHeading3)
                        .foregroundColor(.Gray900)
                        .padding(.bottom, 4)
                    
//                        Text("오늘은 잠을 적게 주무셨네요\n내일은 조금 일찍 잠자리에 들어보는 건 어떨까요?")
                    
                    Text("알맞게 잤어요\n어쩐지 상쾌한 하루!")
                        .font(.ssBlackBody2)
                        .foregroundColor(.Gray900)
                        .lineSpacing(2)
                        .multilineTextAlignment(.center)
                }
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
        .sheet(isPresented: $showEditSleepGoal) {
            if #available(iOS 16.0, *) {
                EditSleepGoalView(sleepGoal: $sleepGoal,
                                   showEditSleepGoal: $showEditSleepGoal)
                    .presentationDetents([.height(400)])
            } else {
                EditSleepGoalView(sleepGoal: $sleepGoal,
                                   showEditSleepGoal: $showEditSleepGoal)
            }
        }
        .padding(20)
        .background(Color.Gray200)
        .navigationTitle("나의 수면량")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EditSleepGoalView: View {
    @Binding var sleepGoal: Int
    @Binding var showEditSleepGoal: Bool
    @StateObject var setGoalVM = SetGoalViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .cornerRadius(30, corners: .allCorners)
                .frame(width: 72, height: 6)
                .foregroundColor(.Gray300)
            
            Text("목표 수면량 수정")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray500)
                .padding(.top, 28)
            
            Divider()
                .padding(.top, 16)
            
            Spacer()
            buttonRow
            Spacer()
            
            Button {
                showEditSleepGoal = false
                setGoalVM.postSleepGoal(sleepGoal: sleepGoal)
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
                sleepGoal -= 1
            } label: {
                ZStack {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.SeeSawRed)
                        .font(.system(size: 48))
                }
            }
            
            HStack(spacing: 0) {
                Text(String(sleepGoal))
                    .font(.system(size: 64))
                    .fontWeight(.bold)
                Text("시간")
                    .font(.ssHeading2)
            }
            .foregroundColor(.Gray900)
            
            Button {
                sleepGoal += 1
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
