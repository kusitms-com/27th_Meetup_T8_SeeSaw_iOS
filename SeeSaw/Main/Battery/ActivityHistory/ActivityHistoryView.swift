//
//  ActivityHistoryView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/20.
//

import SwiftUI

struct ActivityHistoryView: View {
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Today")
                            .font(.ssHeading2)
                            .foregroundColor(.Gray900)
                        Spacer()
                        NavigationLink {
                            
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
        }
        .padding(20)
        .background(Color.Gray200)
        .navigationTitle("나의 활동량")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ActivityHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityHistoryView()
    }
}
