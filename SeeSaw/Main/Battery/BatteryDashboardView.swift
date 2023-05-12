//
//  BatteryDashboardView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/11.
//

import SwiftUI

struct BatteryDashboardView: View {
    @State var progress: Double = 0.8
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("SeeSaw")
                        Spacer()
                        Image(systemName: "person.crop.circle")
                    }
                    .font(.system(size: 28))
                    .padding(.bottom, 28)
                    
                    VStack(alignment: .leading) {
                        Text("에몽님의")
                        Text("에너지 배터리")
                    }
                    .font(.ssHeading1)
                    
                    Button {
                        progress = 0.5
                    } label: {
                        Image(systemName: "questionmark.circle")
                            .font(.system(size: 28))
                            .foregroundColor(.Gray400)
                            .padding(.vertical, 8)
                    }
                }
                .padding(.horizontal, 20)
                
                ZStack(alignment: .center) {
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
                    
                    Text("%")
                        .font(.ssHeading1)
                        .offset(x: 72, y: -40)
                    
                    Text("80")
                        .font(.system(size: 100))
                        .fontWeight(.semibold)
                }
                
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
                        CapsuleButtonView(color: .Gray900,
                                          text: "고속충전하기",
                                          size: .small)
                    }
                }
                
                VStack {
                    HStack {
                        VStack {
                            Text("활동량")
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(.Gray200)
                                .frame(height: 260)
                        }
                        .padding(.horizontal, 8)
                        VStack {
                            Text("활동량")
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(.Gray200)
                                .frame(height: 260)
                        }
                        .padding(.horizontal, 8)
                    }
                    .padding(12)
                    .padding(.bottom, 60)
                }
                .background(Color.Gray100)
            }
        }
        .background(Color.Gray200)
    }
}

struct BatteryDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryDashboardView()
    }
}
