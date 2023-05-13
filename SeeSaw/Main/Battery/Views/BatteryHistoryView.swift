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
            VStack(alignment: .leading, spacing: 0) {
                Text("배터리 수준")
                    .font(.ssHeading2)
                    .foregroundColor(.Gray900)
                    .padding(.bottom, 12)
                
                ZStack(alignment: .bottom) {
                    VStack(spacing: 0) {
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .frame(height: 1)
                            .foregroundColor(.Gray300)
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .frame(height: 1)
                            .foregroundColor(.Gray300)
                            .padding(.vertical, 72)
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .frame(height: 1)
                            .foregroundColor(.Gray300)
                    }
                    
                    HStack(alignment: .bottom, spacing: 24) {
                        Rectangle()
                            .cornerRadius(90, corners: [.topLeft, .topRight])
                            .foregroundColor(.SeeSawYellow)
                            .frame(width: 20, height: 120)
                        
                        Rectangle()
                            .cornerRadius(90, corners: [.topLeft, .topRight])
                            .foregroundColor(.SeeSawYellow)
                            .frame(width: 20, height: 72)
                        Rectangle()
                            .cornerRadius(90, corners: [.topLeft, .topRight])
                            .foregroundColor(.SeeSawYellow)
                            .frame(width: 20, height: 92)
                        Rectangle()
                            .cornerRadius(90, corners: [.topLeft, .topRight])
                            .foregroundColor(.SeeSawYellow)
                            .frame(width: 20, height: 138)
                        Rectangle()
                            .cornerRadius(90, corners: [.topLeft, .topRight])
                            .foregroundColor(.SeeSawYellow)
                            .frame(width: 20, height: 48)
                        Rectangle()
                            .cornerRadius(90, corners: [.topLeft, .topRight])
                            .foregroundColor(.SeeSawYellow)
                            .frame(width: 20, height: 125)
                        Rectangle()
                            .cornerRadius(90, corners: [.topLeft, .topRight])
                            .foregroundColor(.SeeSawYellow)
                            .frame(width: 20, height: 72)
                    }
                }
            }
            .padding(20)
            
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

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct BatteryHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryHistoryView()
    }
}
