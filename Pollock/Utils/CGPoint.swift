//
//  CGPoint.swift
//  Pollock
//
//  Created by Skylar Schipper on 8/3/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation
import CoreGraphics

internal extension CGPoint {
    func distance(fromPoint point: CGPoint) -> CGFloat {
        return sqrt(pow((point.x - self.x), 2.0) + pow(point.y - self.y, 2.0))
    }
}

extension CGPoint : Serializable {
    public init(_ payload: [String : Any]) throws {
        guard let x = payload["x"] as? CGFloat else {
            throw SerializerError("Size missing width")
        }
        guard let y = payload["y"] as? CGFloat else {
            throw SerializerError("Size missing height")
        }
        self.init(x: x, y: y)
    }

    public func serialize() throws -> [String : Any] {
        return ["x": self.x, "y": self.y]
    }
}