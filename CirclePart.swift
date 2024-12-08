
//
//  CirclePart.swift
//  MemoryGame
//
//  Created by student on 06/12/2024.
//

import Foundation
import SwiftUI
import CoreGraphics

struct CirclePart: Shape{
    var startAngle: Angle = Angle.zero
    var endAngle: Angle
    var clockwise: Bool = true
    
    func path(in rect: CGRect) -> Path {
        let startAngle = startAngle - .degrees(90)
        let endAngle = endAngle - .degrees(90)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let radious = min(rect.width, rect.height)/2
        let start = CGPoint(x: center.x + radious * cos(startAngle.radians),
                            y: center.y + radious * sin(startAngle.radians)
        )
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radious, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        p.addLine(to: center)
        return p
    }
}
