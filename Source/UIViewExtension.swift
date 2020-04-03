//
//  UIViewExtension.swift
//  TrelloNavigation
//
//  Created by DianQK on 15/11/9.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

typealias PointForView = (CGPoint) -> UIView?

extension UIView {
    public func addSubviews(_ views: UIView...) {
        views.forEach({self.addSubview($0)})
       
    }
    
    public func addSubviews(_ views: [UIView]) {
        views.forEach({self.addSubview($0)})
    
    }
    
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame = CGRect(origin: newValue, size: frame.size)
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame = CGRect(origin: frame.origin, size: newValue)
        }
    }
    
    var bottomRight: CGPoint {
        get {
            let x = frame.origin.x + frame.size.width
            let y = frame.origin.y + frame.size.height
            return CGPoint(x: x, y: y)
        }
    }
    
    var bottomLeft: CGPoint {
        get {
            let x = frame.origin.x
            let y = frame.origin.y + frame.size.height
            return CGPoint(x: x, y: y)
        }
    }
    
    var topRight: CGPoint {
        get {
            let x = frame.origin.x + frame.size.width
            let y = frame.origin.y
            return CGPoint(x: x, y: y)
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            let newSize = CGSize(width: frame.width, height: newValue)
            frame = CGRect(origin: frame.origin, size: newSize)
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            let newSize = CGSize(width: newValue, height: frame.height)
            frame = CGRect(origin: frame.origin, size: newSize)
        }
    }
    
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            let newOrigin = CGPoint(x: frame.origin.x, y: newValue)
            frame = CGRect(origin: newOrigin, size: frame.size)
        }
    }
    
    var left: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            let newOrigin = CGPoint(x: newValue, y: frame.origin.y)
            frame = CGRect(origin: newOrigin, size: frame.size)
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set {
            let newOrigin = CGPoint(x: frame.origin.x, y: newValue - frame.size.height)
            frame = CGRect(origin: newOrigin, size: frame.size)
        }
    }
    
    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set {
            let newOrigin = CGPoint(x: newValue - frame.origin.x - frame.size.width, y: frame.origin.y)
            frame = CGRect(origin: newOrigin, size: frame.size)
        }
    }
    
    func moveBy(delta: CGPoint) {
        let newCenter = CGPoint(x: center.x + delta.x, y: center.y + delta.y)
        center = newCenter
    }
    
    func scaleBy(scaleFactor: CGFloat) {
        let newSize = CGSize(width: frame.size.width * scaleFactor, height: frame.size.height * scaleFactor)
        frame = CGRect(origin: frame.origin, size: newSize)
    }
    // TODO: Function
    func fitInSize(aSize: CGSize) {
        var scale: CGFloat
        var newFrame = frame
        if newFrame.size.height > aSize.height {
            scale = aSize.height / newFrame.size.height;
            newFrame.size.width *= scale;
            newFrame.size.height *= scale;
        }
        if newFrame.size.width > aSize.width {
            scale = aSize.width / newFrame.size.width;
            newFrame.size.width *= scale;
            newFrame.size.height *= scale;
        }
    }
    
    func pointForSubview(point: CGPoint) -> UIView? {
        for subview in subviews {
            if subview.frame.contains(point) {
                return subview
            }
        }
        return nil
    }
}
