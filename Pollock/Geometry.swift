//
//  Geometry.swift
//  Pollock
//
//  Created by Skylar Schipper on 7/6/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation
import QuartzCore

fileprivate func PadRect(_ original: CGRect, ammount: CGFloat) -> CGRect {
    var rect = original
    rect.origin.x -= ammount
    rect.origin.y -= ammount
    rect.size.width += ammount + ammount
    rect.size.height += ammount + ammount
    return rect
}

func CreateMinimumBoundingRect(forPoints points: [CGPoint], padding: CGFloat) -> CGRect {
    let x = points.map { $0.x }
    let y = points.map { $0.y }
    let minX = x.min() ?? 0.0
    let minY = y.min() ?? 0.0
    let maxX = x.max() ?? 0.0
    let maxY = y.max() ?? 0.0
    let rect = CGRect(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    return PadRect(rect, ammount: padding)
}
