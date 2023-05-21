//
//  BatteryDashboardView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/11.
//

import SwiftUI

struct BatteryDashboardView: View {
    @AppStorage("nickname") var nickname: String = ""
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
    @State var todaySleepAmount: Int = 6
    @State var isTodaySleepAmountExist: Bool = false
    @State var sleepCondition: String = "Bad"
    enum SleepDescription {
        static let GoodIcon = "😙"
        static let GoodDescription = "알맞게 잤어요"
        static let BadIcon = "😑"
        static let BadDescription = "적게 잤어요"
        static let TerribleIcon = "🤯"
        static let TerribleDescription = "너무 적게 잤어요"
    }
    
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
                            BatteryDashboardFastChargeView(isFastChargeExist: $isFastChargeExist,
                                                           fastChargeTitle: $fastChargeTitle,
                                                           fastChargeValue: $fastChargeValue)
                            
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
        .sheet(isPresented: $showBatteryInformation, content: {
            if #available(iOS 16.0, *) {
                BatteryInformationView()
                    .presentationDetents([.fraction(0.6)])
            } else {
                BatteryInformationView()
            }
        })
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
    
    // 활동량
    var energy: some View {
        VStack(alignment: .leading) {
            Text("활동량")
                .font(.ssHeading2)
            NavigationLink {
                ActivityHistoryView()
            } label: {
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
    
    // 수면
    var sleep: some View {
        VStack(alignment: .leading) {
            Text("수면")
                .font(.ssHeading2)
            ZStack(alignment: .bottom) {
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(.Gray200)
                    .frame(height: 260)
                if isTodaySleepAmountExist {
                    sleepStatus
                } else if isSleepGoalExist {
                    setTodaySleepAmount
                } else {
                    setSleepGoal
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    var sleepStatus: some View {
        VStack(alignment: .center, spacing: 12) {
            HStack {
                Text("얼마나 주무셨나요?")
                Spacer()
            }
            .font(.ssBlackBody1)
            .foregroundColor(.Gray500)
            .padding(.leading, 8)
            
            Spacer()
            
            Text("\(todaySleepAmount)시간")
                .font(.ssHeading1)
                .foregroundColor(.Gray900)
            if sleepCondition == "Good" {
                Text("\(SleepDescription.GoodIcon)")
                    .font(.system(size: 60))
                
                Spacer()
                
                Text(SleepDescription.GoodDescription)
                    .font(.ssWhiteBody1)
                    .foregroundColor(.GrayBlack)
                    .padding(.trailing, 8)
            } else if sleepCondition == "Bad" {
                Text("\(SleepDescription.BadIcon)")
                    .font(.system(size: 60))
                
                Spacer()
                
                Text(SleepDescription.BadDescription)
                    .font(.ssWhiteBody1)
                    .foregroundColor(.GrayBlack)
                    .padding(.trailing, 8)
            } else {
                Text("\(SleepDescription.TerribleIcon)")
                    .font(.system(size: 60))
                
                Spacer()
                
                Text(SleepDescription.TerribleDescription)
                    .font(.ssWhiteBody1)
                    .foregroundColor(.GrayBlack)
                    .padding(.trailing, 8)
            }
        }
        .padding(.vertical, 16)
    }
    
    var setTodaySleepAmount: some View {
        VStack(alignment: .center, spacing: 12) {
            HStack {
                Text("얼마나 주무셨나요?")
                Spacer()
            }
            .font(.ssBlackBody1)
            .foregroundColor(.Gray500)
            .padding(.leading, 8)
            
            Spacer()
            
            Text("\(todaySleepAmount)시간")
                .font(.ssHeading1)
                .foregroundColor(.Gray400)
                
            HStack {
                Button {
                    todaySleepAmount -= 1
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.SeeSawRed)
                }
                Button {
                    todaySleepAmount += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.SeeSawGreen)
                }
            }
            
            Spacer()
            Button {
                isTodaySleepAmountExist = true
            } label: {
                CapsuleButtonView(color: .Gray900, text: "입력 완료", size: .large)
                    .padding(.horizontal, 12)
            }
        }
        .padding(.vertical, 16)
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
