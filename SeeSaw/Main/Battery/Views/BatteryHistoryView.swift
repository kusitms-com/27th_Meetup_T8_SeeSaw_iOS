//
//  BatteryHistoryView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/13.
//

import SwiftUI

struct BatteryHistoryView: View {
    var body: some View {
        VStack {
            BatteryVariationView()
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text("배터리 내역")
                        .font(.ssHeading2)
                        .foregroundColor(.Gray900)
                        .padding(.bottom, 12)
                    
                    VStack(alignment: .leading) {
                        Text("2022.04.29")
                        HStack {
                            Circle()
                                .foregroundColor(.Gray400)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("활동량")
                                Text("초과 달성 280Kcal / 200Kcal")
                            }
                            
                            Spacer()
                            
                            Text("-10%")
                                .foregroundColor(.SeeSawRed)
                        }
                        HStack {
                            Circle()
                                .foregroundColor(.Gray400)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("활동량")
                                Text("초과 달성 280Kcal / 200Kcal")
                            }
                            
                            Spacer()
                            
                            Text("-10%")
                                .foregroundColor(.SeeSawRed)
                        }
                        HStack {
                            Circle()
                                .foregroundColor(.Gray400)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("활동량")
                                Text("초과 달성 280Kcal / 200Kcal")
                            }
                            
                            Spacer()
                            
                            Text("-10%")
                                .foregroundColor(.SeeSawRed)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                    .background {
                        Rectangle()
                            .cornerRadius(12, corners: .allCorners)
                            .foregroundColor(.Gray100)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("2022.04.29")
                        HStack {
                            Circle()
                                .foregroundColor(.Gray400)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("활동량")
                                Text("초과 달성 280Kcal / 200Kcal")
                            }
                            
                            Spacer()
                            
                            Text("-10%")
                                .foregroundColor(.SeeSawRed)
                        }
                        HStack {
                            Circle()
                                .foregroundColor(.Gray400)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("활동량")
                                Text("초과 달성 280Kcal / 200Kcal")
                            }
                            
                            Spacer()
                            
                            Text("-10%")
                                .foregroundColor(.SeeSawRed)
                        }
                        HStack {
                            Circle()
                                .foregroundColor(.Gray400)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("활동량")
                                Text("초과 달성 280Kcal / 200Kcal")
                            }
                            
                            Spacer()
                            
                            Text("-10%")
                                .foregroundColor(.SeeSawRed)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                    .background {
                        Rectangle()
                            .cornerRadius(12, corners: .allCorners)
                            .foregroundColor(.Gray100)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("2022.04.29")
                        HStack {
                            Circle()
                                .foregroundColor(.Gray400)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("활동량")
                                Text("초과 달성 280Kcal / 200Kcal")
                            }
                            
                            Spacer()
                            
                            Text("-10%")
                                .foregroundColor(.SeeSawRed)
                        }
                        HStack {
                            Circle()
                                .foregroundColor(.Gray400)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("활동량")
                                Text("초과 달성 280Kcal / 200Kcal")
                            }
                            
                            Spacer()
                            
                            Text("-10%")
                                .foregroundColor(.SeeSawRed)
                        }
                        HStack {
                            Circle()
                                .foregroundColor(.Gray400)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("활동량")
                                Text("초과 달성 280Kcal / 200Kcal")
                            }
                            
                            Spacer()
                            
                            Text("-10%")
                                .foregroundColor(.SeeSawRed)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                    .background {
                        Rectangle()
                            .cornerRadius(12, corners: .allCorners)
                            .foregroundColor(.Gray100)
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle("나의 배터리")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.Gray200)
    }
}

struct BatteryVariationView: View {
    let data: [BatteryHistory] = [
        BatteryHistory(date: "2023-05-16", batteryPercentage: 80),
        BatteryHistory(date: "2023-05-15", batteryPercentage: 30),
        BatteryHistory(date: "2023-05-14", batteryPercentage: 95),
        BatteryHistory(date: "2023-05-13", batteryPercentage: 85),
        BatteryHistory(date: "2023-05-12", batteryPercentage: 40),
        BatteryHistory(date: "2023-05-11", batteryPercentage: 90),
        BatteryHistory(date: "2023-05-10", batteryPercentage: 65)]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("배터리 수준")
                .font(.ssHeading2)
                .foregroundColor(.Gray900)
                .padding(.bottom, 12)
            
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    dashedLine
                    dashedLine
                        .padding(.vertical, 72)
                    dashedLine
                }
                
                HStack(alignment: .bottom, spacing: 16) {
                    ForEach(data.indices, id: \.self) { index in
                        let rev = 6 - index
                        let height = CGFloat((148 * data[rev].batteryPercentage)) / 100
                        
                        VStack {
                            Rectangle()
                                .cornerRadius(90, corners: [.topLeft, .topRight])
                                .foregroundColor(.SeeSawYellow)
                                .frame(width: 20, height: height)
                            
                            Text(data[rev].date.suffix(5))
                                .font(.ssBlackBody4)
                                .foregroundColor(.Gray400)
                        }
                        .offset(y: 18)
                    }
                }
            }
        }
        .padding(20)
    }
    
    var dashedLine: some View {
        Line()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .frame(height: 1)
            .foregroundColor(.Gray300)
    }
}

struct BatteryHistory {
    let date: String
    let batteryPercentage: Int
}

struct BatteryHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryHistoryView()
    }
}
