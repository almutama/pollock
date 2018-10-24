//
//  CGSize.swift
//  Pollock
//
//  Created by Skylar Schipper on 8/22/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation

extension CGSize : Serializable {
    public init(_ payload: [String : Any]) throws {
        guard let width = payload["width"] as? Double else {
            throw SerializerError("Size missing width")
        }
        guard let height = payload["height"] as? Double else {
            throw SerializerError("Size missing height")
        }
        self.init(width: CGFloat(width), height: CGFloat(height))
    }

    public func serialize() throws -> [String : Any] {
        return [
            "width": self.width,
            "height": self.height
        ]
    }
}
