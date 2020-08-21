//
//  SamuiTabBar.swift
//  180Samui
//
//  Created by JasonMac on 19/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit

@IBDesignable // So we can assign in Storyboard.
class SamuiTabBar: UITabBar {
    
    private var layerShaper: CALayer?
    
    // Override draw() to perform custom drawing.
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    private func addShape() {
        let newLayerShape = CAShapeLayer()
        newLayerShape.path = createPathCircle()
        newLayerShape.strokeColor = UIColor.lightGray.cgColor
        newLayerShape.fillColor = UIColor.white.cgColor
        newLayerShape.lineWidth = 1.0
        
        if let oldLayerShape = self.layerShaper {
            self.layer.replaceSublayer(oldLayerShape, with: newLayerShape)
        } else {
            self.layer.insertSublayer(newLayerShape, at: 0)
        }
        
        self.layerShaper = newLayerShape
        
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        let buttonRadius: CGFloat = 35
//        return abs(self.center.x - point.x) > buttonRadius || abs(point.y) > buttonRadius
        
        //let buttonRadius: CGFloat = 35
        //        return abs(self.center.x - point.x) > buttonRadius || abs(point.y) > buttonRadius
        print("PRESSED")

        if self.bounds.contains(point) {
            let buttonRadius: CGFloat = 35
            let value = abs(self.center.x - point.x) > buttonRadius || abs(point.y) > buttonRadius
            return value
        } else {
            return false
        }
    }
    
    func createPathCircle() -> CGPath {
        
        let radius: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - radius * 2), y: 0))
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 0), radius: radius, startAngle: CGFloat(180).degreesToRadians, endAngle: CGFloat(0).degreesToRadians, clockwise: false)
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }
}

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
