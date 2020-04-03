//
//  TrelloFunction.swift
//  TrelloNavigation
//
//  Created by DianQK on 15/11/12.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

/// Taste Function Programming
// TODO: Combine CGPoint


func add(x: CGFloat) -> TransformPoint {
    return { point in
        return CGPoint(x: point.x + x, y: point.y)
    }
}

func add(y: CGFloat) -> TransformPoint {
    return { point in
        return CGPoint(x: point.x, y: point.y + y)
    }
}

func add(x: CGFloat, y: CGFloat) -> TransformPoint {
    return { point in
        return add(y: y)( add(x: x)(point) )
    }
}

extension UIBezierPath {
    func addSquare(center: CGPoint, width: CGFloat) {
        self.move(to: add(x: center.x - width / 2.0, y: center.y - width / 2.0)(center))
        self.addLine(to: add(x: center.x + width / 2.0, y: center.y - width / 2.0)(center))
        self.addLine(to: add(x: center.x + width / 2.0, y: center.y + width / 2.0)(center))
        self.addLine(to: add(x: center.x - width / 2.0, y: center.y + width / 2.0)(center))
        self.addLine(to: add(x: center.x - width / 2.0, y: center.y - width / 2.0)(center))
    }
}
