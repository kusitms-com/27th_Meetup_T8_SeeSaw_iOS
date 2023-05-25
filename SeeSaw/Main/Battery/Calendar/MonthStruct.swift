//
//  MonthStruct.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/20.
//

import Foundation
import SwiftUI

struct MonthStruct {
    var monthType: MonthType
    var dayInt: Int
    func day() -> String {
        return String(dayInt)
    }
}

enum MonthType {
    case previous
    case current
    case next
}
