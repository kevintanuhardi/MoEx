//
//  HandGestureProcessor.swift
//  MoEx
//
//  Created by Randy Efan Jayaputra on 17/06/21.
//

import CoreGraphics

class BodyPoseProcessor{
    
    typealias AngleAxis = (firstAxis: CGPoint, secondAxis: CGPoint, center: CGPoint)
    
    static func calculateAngle(first: CGPoint, second: CGPoint, center: CGPoint) -> Double{
        let numerator = Double((center.y * (first.x - second.x)) + (first.y * (second.x - center.x)) + (second.y * (center.x - first.x)))
        let denominator = Double((center.x - first.x) * (first.x - second.x) + (center.y-first.y) * (first.y-second.y))
        let ratio = numerator / denominator
        let angleRad = atan(ratio)
        var angleDeg = (angleRad * 180)/Double.pi
        if angleDeg < 0 {
            angleDeg += 180
        }
        return angleDeg
        
    }
    
    func processPoints(_ angleAxis: AngleAxis) {
        let firstAxis = angleAxis.firstAxis
        let secondAxis = angleAxis.secondAxis
        let center = angleAxis.center
        print("angle",BodyPoseProcessor.calculateAngle(first: firstAxis, second: secondAxis, center: center))
    }
}

// MARK: - CGPoint helpers

extension CGPoint {

    static func midPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
        return CGPoint(x: (p1.x + p2.x) / 2, y: (p1.y + p2.y) / 2)
    }
    
    func distance(from point: CGPoint) -> CGFloat {
        return hypot(point.x - x, point.y - y)
    }
}

