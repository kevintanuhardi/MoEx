//
//  BodyPoseProcessor.swift
//  MoEx
//
//  Created by Ahmad Zaky on 17/06/21.
//

import Foundation
import CoreGraphics

class BodyPoseProcessor{
    
    typealias AngleAxis = (firstAxis: CGPoint, secondAxis: CGPoint, center: CGPoint)
    
    static func calculateAngle(first: CGPoint, second: CGPoint, center: CGPoint) -> CGFloat{
        let xDistA = center.x - second.x
        let yDistA = center.y - second.y
        let a = sqrt((xDistA * xDistA) + (yDistA * yDistA))
        
        let xDistB = first.x - second.x
        let yDistB = first.y - second.y
        let b = sqrt((xDistB * xDistB) + (yDistB * yDistB))
        
        let xDistC = center.x - first.x
        let yDistC = center.y - first.y
        let c = sqrt((xDistC * xDistC) + (yDistC * yDistC))
        
        return acos(((a*a) + (c*c) - (b*b)) / ((2*a*c)))
        
    }
    
    func processPoints(_ angleAxis: AngleAxis) {
        let firstAxis = angleAxis.firstAxis
        let secondAxis = angleAxis.secondAxis
        let center = angleAxis.center
        print("angle",BodyPoseProcessor.calculateAngle(first: firstAxis, second: secondAxis, center: center))
    }
}
