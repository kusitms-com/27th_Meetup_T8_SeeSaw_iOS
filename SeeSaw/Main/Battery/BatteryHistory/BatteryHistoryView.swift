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
            BatteryChartView()
            
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

struct BatteryHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryHistoryView()
    }
}
