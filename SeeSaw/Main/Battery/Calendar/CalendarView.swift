//
//  CalendarView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/20.
//

import SwiftUI

enum HistoryContext {
    case activity, sleep
}

struct CalendarView: View {
    @State var context: HistoryContext
    
    @EnvironmentObject var dateHolder: DateHolder
    @StateObject private var batteryVM = BatteryViewModel()
    
    @State var infoArray: [ActivityDayInfo] = []
    @State var sleepInfoArray: [SleepDayInfo] = []
    
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
                        Text(context == .activity ? "너무 많이 움직였어요" : "알맞게 잤어요")
                            .font(.ssBlackBody3)
                    }
                    HStack(spacing: 4) {
                        Rectangle()
                            .cornerRadius(4, corners: .allCorners)
                            .foregroundColor(.BatteryMedium)
                            .frame(width: 16, height: 16)
                        Text(context == .activity ? "알맞게 움직였어요" : "적게 잤어요")
                            .font(.ssBlackBody3)
                    }
                    HStack(spacing: 4) {
                        Rectangle()
                            .cornerRadius(4, corners: .allCorners)
                            .foregroundColor(.BatteryLow)
                            .frame(width: 16, height: 16)
                        Text(context == .activity ? "적게 움직였어요" : "너무 적게 잤어요")
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
            
            ForEach(0 ..< 6) { row in
                HStack(spacing: 0) {
                    ForEach(1..<8) { column in
                        let count = column + (row * 7)
                        if context == .activity {
                            if let index = infoArray.firstIndex(where: { $0.day == (count - startingSpaces) }) {
                                CalendarCell(context: $context,
                                             count: count,
                                             startingSpaces: startingSpaces,
                                             daysInMonth: daysInMonth,
                                             daysInPrevMonth: daysInPrevMonth,
                                             activityAmount: infoArray[index].activity ?? 999,
                                             colorType: infoArray[index].color ?? 4)
                                .environmentObject(dateHolder)
                            } else {
                                CalendarCell(context: $context,
                                             count: count,
                                             startingSpaces: startingSpaces,
                                             daysInMonth: daysInMonth,
                                             daysInPrevMonth: daysInPrevMonth,
                                             activityAmount: 0,
                                             colorType: 4)
                                .environmentObject(dateHolder)
                            }
                        } else {
                            if let index = sleepInfoArray.firstIndex(where: { $0.day == (count - startingSpaces) }) {
                                CalendarCell(context: $context,
                                             count: count,
                                             startingSpaces: startingSpaces,
                                             daysInMonth: daysInMonth,
                                             daysInPrevMonth: daysInPrevMonth,
                                             activityAmount: sleepInfoArray[index].sleep ?? 0,
                                             colorType: sleepInfoArray[index].color ?? 4)
                                .environmentObject(dateHolder)
                            } else {
                                CalendarCell(context: $context,
                                             count: count,
                                             startingSpaces: startingSpaces,
                                             daysInMonth: daysInMonth,
                                             daysInPrevMonth: daysInPrevMonth,
                                             activityAmount: 0,
                                             colorType: 4)
                                .environmentObject(dateHolder)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            if context == .activity {
                fetchActivity()
            } else {
                fetchSleep()
            }
        }
        .onChange(of: dateHolder.date) { _ in
            if context == .activity {
                fetchActivity()
            } else {
                fetchSleep()
            }
        }
    }
    
    func fetchActivity() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMM"
        
        let date = dateFormatter.string(from: dateHolder.date)
        let year = Int(date.prefix(4)) ?? 0
        let month = Int(date.suffix(2)) ?? 0
        print(date, year, month)
        
        batteryVM.getMonthActivityHistory(year: year, month: month) { activityMonthInfo in
            infoArray = activityMonthInfo
        }
    }
    
    func fetchSleep() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMM"
        
        let date = dateFormatter.string(from: dateHolder.date)
        let year = Int(date.prefix(4)) ?? 0
        let month = Int(date.suffix(2)) ?? 0
        print(date, year, month)
        
        batteryVM.getMonthSleepHistory(year: year, month: month) { sleepMonthInfo in
            sleepInfoArray = sleepMonthInfo
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
