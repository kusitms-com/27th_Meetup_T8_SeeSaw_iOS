//
//  RightHalfCircle.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/19.
//

import SwiftUI

struct RightHalfCircle: Shape {
    var plusRatio: Double
    var addAngle: Double {
        return plusRatio * 180
    }
    
    func path(in rect: CGRect) -> Path {
        let radius = rect.width / 2
        let center = CGPoint(x: 0, y: rect.midY + 10)
        let startAngle: Angle = .degrees(-90)
        let endAngle: Angle = .degrees(-90 + addAngle)
        var path = Path()
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        return path
    }
}
