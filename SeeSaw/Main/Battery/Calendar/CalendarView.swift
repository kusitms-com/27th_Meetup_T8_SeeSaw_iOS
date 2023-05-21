//
//  CalendarView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/20.
//

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        VStack {
            DateScrollerView()
                .environmentObject(dateHolder)
                .padding(.top, 24)
                .padding(.bottom, 16)
            dayOfWeekStack
            calendarGrid
            
            HStack {
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 4) {
                        Rectangle()
                            .cornerRadius(4, corners: .allCorners)
                            .foregroundColor(.BatteryHigh)
                            .frame(width: 16, height: 16)
                        Text("너무 많이 움직였어요")
                            .font(.ssBlackBody3)
                    }
                    HStack {
                        Rectangle()
                            .cornerRadius(4, corners: .allCorners)
                            .foregroundColor(.BatteryMedium)
                            .frame(width: 16, height: 16)
                        Text("알맞게 움직였어요")
                            .font(.ssBlackBody3)
                    }
                    HStack {
                        Rectangle()
                            .cornerRadius(4, corners: .allCorners)
                            .foregroundColor(.BatteryLow)
                            .frame(width: 16, height: 16)
                        Text("적게 움직였어요")
                            .font(.ssBlackBody3)
                    }
                }
            }
            .offset(y: -32)
            .padding(.trailing, 8)
        }
    }
    
    var dayOfWeekStack: some View {
        HStack(spacing: 1) {
            let daysOfWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
            ForEach(daysOfWeek, id: \.self) { day in
                Text(day)
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray500)
                    .dayOfWeek()
            }
        }
    }
    
    var calendarGrid: some View {
        VStack(spacing: 0) {
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
            let weekOfMonth = CalendarHelper().numberOfWeeks(dateHolder.date)
            
            ForEach(0 ..< 6) { row in
                HStack(spacing: 0) {
                    ForEach(1..<8) { column in
                        let count = column + (row * 7)
                        CalendarCell(count: count,
                                     startingSpaces: startingSpaces,
                                     daysInMonth: daysInMonth,
                                     daysInPrevMonth: daysInPrevMonth,
                                     activityAmount: 200,
                                     colorType: row)
                            .environmentObject(dateHolder)
                    }
                }
            }
        }
    }
}

extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: .infinity)
            .padding(2)
            .lineLimit(1)
    }
}
