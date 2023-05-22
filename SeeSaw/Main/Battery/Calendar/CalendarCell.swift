//
//  CalendarCell.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/20.
//

import SwiftUI

struct CalendarCell: View {
    @EnvironmentObject var dateHolder: DateHolder
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    let daysInPrevMonth: Int
    let activityAmount: Int?
    let colorType: Int
    let colorArray: [Int: Color] = [0: Color.Gray300,
                                    1: Color.BatteryLow,
                                    2: Color.BatteryMedium,
                                    3: Color.BatteryHigh]
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(8, corners: .allCorners)
                .foregroundColor(monthStruct().monthType == MonthType.current ? colorArray[colorType] : Color.Gray100.opacity(0.0))
                .frame(height: 52)
                .frame(maxWidth: .infinity)
            VStack(spacing: 4) {
                Text(monthStruct().day())
                    .font(.ssBlackTitle2)
                    .foregroundColor(.Gray900.opacity(textOpacity(type: monthStruct().monthType)))
                    .frame(maxWidth: .infinity)
                Text(activityAmount == nil ? "" : String(activityAmount ?? 0) + "kcal")
                    .font(.ssBlackBody4)
                    .foregroundColor(.Gray900.opacity(textOpacity(type: monthStruct().monthType)))
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    func monthStruct() -> MonthStruct {
        let start = startingSpaces
        
        if count <= start {
            let day = daysInPrevMonth + count - start
            return MonthStruct(monthType: MonthType.previous, dayInt: day)
        } else if count - start > daysInMonth {
            let day = count - start - daysInMonth
            return MonthStruct(monthType: MonthType.next, dayInt: day)
        }
        
        let day = count - start
        return MonthStruct(monthType: MonthType.current, dayInt: day)
    }
    
    func textOpacity(type: MonthType) -> Double {
        return type == MonthType.current ? 1.0 : 0.0
    }
    
}
