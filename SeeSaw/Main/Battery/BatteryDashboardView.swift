//
//  BatteryDashboardView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/11.
//

import SwiftUI

struct BatteryDashboardView: View {
    @State var progress: Double = 0.2
    @State private var showBatteryInformation: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    header
                    batteryProgress
                    
                    // 고속충전
                    ZStack {
                        Rectangle()
                            .cornerRadius(200,
                                          corners: .allCorners)
                            .foregroundColor(.Gray100)
                            .frame(width: 380, height: 200)
                        
                        VStack {
                            Text("고속충전")
                                .font(.ssHeading2)
                                .padding(4)
                            Text("아직 고속충전을 하지 않았어요")
                            Text("고속충전을 하러 가볼까요")
                            Button {
                                progress = 0.8
                            } label: {
                                CapsuleButtonView(color: .Gray900,
                                                  text: "고속충전하기",
                                                  size: .small)
                            }
                        }
                    }
                    
                    // 활동량, 수면
                    VStack {
                        HStack {
                            // 활동량
                            VStack(alignment: .leading) {
                                Text("활동량")
                                    .font(.ssHeading2)
                                ZStack(alignment: .bottom) {
                                    Rectangle()
                                        .cornerRadius(10)
                                        .foregroundColor(.Gray200)
                                        .frame(height: 260)
                                    VStack {
                                        Text("활동량 목표")
                                            .font(.ssBlackBody1)
                                            .foregroundColor(.Gray500)
                                        CapsuleButtonView(color: .Gray900,
                                                          text: "설정하기",
                                                          size: .small)
                                    }
                                    .padding(.bottom, 12)
                                }
                            }
                            .padding(.horizontal, 8)
                            
                            // 수면
                            VStack(alignment: .leading) {
                                Text("수면")
                                    .font(.ssHeading2)
                                ZStack(alignment: .bottom) {
                                    Rectangle()
                                        .cornerRadius(10)
                                        .foregroundColor(.Gray200)
                                        .frame(height: 260)
                                    VStack {
                                        Text("수면시간 목표")
                                            .font(.ssBlackBody1)
                                            .foregroundColor(.Gray500)
                                        CapsuleButtonView(color: .Gray900,
                                                          text: "설정하기",
                                                          size: .small)
                                    }
                                    .padding(.bottom, 12)
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                        .padding(12)
                        .padding(.bottom, 60)
                    }
                    .background(Color.Gray100)
                }
            }
            .navigationTitle("")
            .background(Color.Gray200)
        }
        .sheet(isPresented: $showBatteryInformation) {
            BatteryInformationView()
                .frame(height: 400)
        }
        
    }
    
    // 닉네임, 마이페이지, 배터리정보
    var header: some View {
        VStack(alignment: .leading, spacing: 0) {
            myPageToolBarRow
            title
            batteryInformationButton
        }
        .padding(.horizontal, 20)
    }
    
    var myPageToolBarRow: some View {
        HStack {
            Text("SeeSaw")
            Spacer()
            NavigationLink {
                MyPageView()
            } label: {
                Image(systemName: "person.crop.circle")
            }
        }
        .font(.system(size: 28))
        .foregroundColor(.Gray400)
        .padding(.bottom, 28)
    }
    
    var title: some View {
        VStack(alignment: .leading) {
            Text("에몽님의")
            Text("에너지 배터리")
        }
        .font(.ssHeading1)
    }
    
    var batteryInformationButton: some View {
        Button {
            showBatteryInformation = true
        } label: {
            Image(systemName: "questionmark.circle")
                .font(.system(size: 28))
                .foregroundColor(.Gray400)
                .padding(.vertical, 8)
        }
    }
    
    // 배터리 원형 표시
    var batteryProgress: some View {
        ZStack(alignment: .center) {
            batteryProgressCircle
            batteryValue
        }
    }
    
    var batteryProgressCircle: some View {
        ZStack {
            Circle()
                .foregroundColor(.Gray100)
                .frame(width: 380, height: 380)
            
            Circle()
                .stroke( // 1
                    Color.SeeSawGreen.opacity(0.3),
                    lineWidth: 30
                )
                .frame(width: 300, height: 300)
            
            Circle()
                .trim(from: 0, to: progress) // 1
                .stroke(
                    Color.SeeSawGreen,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
    }
    
    var batteryValue: some View {
        ZStack {
            Text("%")
                .font(.ssHeading1)
                .offset(x: 72, y: -40)
            
            Text("\(Int(progress * 100))")
                .font(.system(size: 100))
                .fontWeight(.semibold)
        }
    }
}

struct BatteryDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryDashboardView()
    }
}
