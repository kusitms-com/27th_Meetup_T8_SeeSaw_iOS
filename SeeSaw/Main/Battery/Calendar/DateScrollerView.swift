//
//  DateScrollerView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/20.
//

import SwiftUI

struct DateScrollerView: View {
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                previousMonth()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.SeeSawGreen)
                    .font(.system(size: 16))
            }
            
            Text(CalendarHelper().monthYearString(dateHolder.date))
                .font(Font.title3.weight(.bold))
                .animation(.none)
            
            Button {
                nextMonth()
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.SeeSawGreen)
                    .font(.system(size: 16))
            }
            
            Spacer()
            
            Button {
                today()
            } label: {
                Image(systemName: "arrow.uturn.left")
                    .foregroundColor(.Gray300)
                    .font(.system(size: 20))
                    .padding(.trailing, 16)
            }
        }
    }
    
    func previousMonth() {
        dateHolder.date = CalendarHelper().minusMonth(dateHolder.date)
    }
    
    func nextMonth() {
        dateHolder.date = CalendarHelper().plusMonth(dateHolder.date)
    }
    
    func today() {
        dateHolder.date = Date()
    }
}
