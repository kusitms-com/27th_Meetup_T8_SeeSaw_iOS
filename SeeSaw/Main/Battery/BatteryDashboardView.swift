//
//  BatteryDashboardView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/11.
//

import SwiftUI

struct BatteryDashboardView: View {
    @AppStorage("nickname") var nickname: String = "이오링"
    @State private var showBatteryInformation: Bool = false
    
    @State var battery: Int = 0
    
    @State var isFastChargeExist: Bool = true
    @State var fastChargeTitle: String = "홍제천 산책하기"
    @State var fastChargeValue: String = "여유"
    
    @State var isEnergyGoalExist: Bool = true
    var energyGoal: Int = 250
    var todayEnergy: Int = 160
    var energyRatio: Double {
        let ratio = Double(todayEnergy) / Double(energyGoal)
        return ratio < 1.0 ? ratio : 1.0
    }
    
    @State var isSleepGoalExist: Bool = false
    
    @State private var show = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                toolBar
                
                GeometryReader { geometry in
                    ScrollView {
                        VStack(alignment: .center, spacing: 0) {
                            title
                                .padding(.top, 10)
                                .padding(.horizontal, 20)
                            
                            // 배터리
                            ZStack(alignment: .topLeading) {
                                // 배터리 원형 그래프
                                NavigationLink {
                                    BatteryHistoryView()
                                } label: {
                                    BatteryProgressCircleView(geometry: geometry, battery: $battery)
                                }
                                
                                // 배터리 정보 버튼
                                batteryInfoButton
                            }
                            .padding(.top, 12)
                            
                            // 고속충전
                            // fastCharge
                            
                            // 활동량, 수면
                            VStack {
                                HStack {
                                    energy
                                    sleep
                                }
                                .padding(12)
                                .padding(.bottom, 32)
                            }
                            .background(Color.Gray100)
                        }
                    } // ScrollView
                } // GeometryReder
                .background(Color.Gray200)
            }
            .navigationTitle("")
        }
        .sheet(isPresented: $showBatteryInformation) {
            BatteryInformationView()
        }
        .onAppear {
            print("onappear")
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                battery = 80
            }
        }
        
    }

    // "라이프로그", 마이페이지 버튼
    var toolBar: some View {
        HStack {
            Image("LifeLog")
            Spacer()
            NavigationLink {
                MyPageView()
            } label: {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 28))
                    .foregroundColor(.Gray400)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 8)
        .background(Color.Gray100)
    }
    
    // ##님의 에너지 배터리
    var title: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(nickname)님의")
                Text("에너지 배터리")
            }
            .font(.ssHeading1)
            
            Spacer()
        }
    }
    
    // 배터리에 대한 정보 모달을 보여주는 버튼
    var batteryInfoButton: some View {
        Button {
            showBatteryInformation = true
        } label: {
            Image(systemName: "questionmark.circle")
                .font(.system(size: 28))
                .foregroundColor(.Gray400)
                .padding(.leading, 20)
        }
    }
    
    // 고속충전 현황
    var fastCharge: some View {
        ZStack {
            ZStack(alignment: .top) {
                HalfCircle()
                    .fill()
                    .aspectRatio(2.0, contentMode: .fit)
                    .foregroundColor(.Gray100)
                
                HStack {
                    Text("고속충전")
                        .font(.ssHeading2)
                        .foregroundColor(.Gray900)
                        .padding(.leading, 20)
                        .padding(.top, 28)
                    
                    Spacer()
                }
            }
            
            if isFastChargeExist {
                fastChargeStatus
            } else {
                fastChargeButton
            }
        }
    }
    
    var fastChargeStatus: some View {
        VStack(spacing: 12) {
            Image("FastChargeCheck")
            Text(fastChargeTitle)
                .font(.ssWhiteBody2)
                .foregroundColor(.Gray600)
            HStack {
                Text(fastChargeValue)
                    .foregroundColor(.SeeSawBlue)
                Text("가득한 하루!")
                    .foregroundColor(.Gray900)
            }
            .font(.ssWhiteSubTitle)
        }
    }
    
    // 고속충전 추가 버튼
    var fastChargeButton: some View {
        VStack {
            VStack {
                Text("오늘 고속충전을 하지 않았어요")
                Text("지금 하러 가볼까요?")
            }
            .font(.ssBlackBody2)
            
            NavigationLink {
                FastChargeView()
            } label: {
                CapsuleButtonView(color: .Gray900,
                                  text: "고속충전하기",
                                  size: .small)
            }
        }
    }
    
    // 활동량, 수면
    var energy: some View {
        VStack(alignment: .leading) {
            Text("활동량")
                .font(.ssHeading2)
            ZStack(alignment: .bottom) {
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(.Gray200)
                    .frame(height: 260)
                if isEnergyGoalExist {
                    energyStatus
                } else {
                    setEnergyGoal
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    var energyStatus: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("얼마나 움직이셨나요?")
                .font(.ssBlackBody1)
                .foregroundColor(.Gray500)
                .padding(.leading, 8)
            
            ZStack {
                RightHalfCircle(plusRatio: 1.0)
                    .stroke(Color.BatteryLow, lineWidth: 32)
                RightHalfCircle(plusRatio: energyRatio)
                    .stroke(Color.BatteryHigh, lineWidth: 32)
            }
            
            HStack {
                Spacer()
                Text("\(todayEnergy) / \(energyGoal) kcal")
                    .font(.ssWhiteBody1)
                    .foregroundColor(.GrayBlack)
                    .padding(.trailing, 8)
            }
        }
        .padding(.vertical, 16)
    }
    
    var setEnergyGoal: some View {
        ZStack(alignment: .bottom) {
            Image("SetGoalImage")
            VStack {
                Text("활동량 목표")
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray500)
                
                NavigationLink {
                    ProvisioningEnergyView()
                } label: {
                    CapsuleButtonView(color: .Gray900,
                                      text: "설정하기",
                                      size: .small)
                }
            }
            .padding(.bottom, 12)
        }
    }
    
    var sleep: some View {
        VStack(alignment: .leading) {
            Text("수면")
                .font(.ssHeading2)
            ZStack(alignment: .bottom) {
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(.Gray200)
                    .frame(height: 260)
                if isSleepGoalExist {
                    
                } else {
                    setSleepGoal
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    var setSleepGoal: some View {
        ZStack(alignment: .bottom) {
            Image("SetSleepGoalImage")
            VStack {
                Text("수면시간 목표")
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray500)
                NavigationLink {
                    SetSleepGoalView()
                } label: {
                    CapsuleButtonView(color: .Gray900,
                                      text: "설정하기",
                                      size: .small)
                }
            }
            .padding(.bottom, 12)
        }
    }
}

struct BatteryDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryDashboardView()
    }
}
