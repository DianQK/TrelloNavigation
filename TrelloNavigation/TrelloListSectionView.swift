//
//  TrelloListSectionView.swift
//  TrelloNavigation
//
//  Created by 宋宋 on 15/11/11.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

class TrelloListSectionView: UIView {
    
    private var titleLabel: UILabel
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        // TODO: 尝试函数式编程
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 20, y: 20))
        path.addLineToPoint(CGPoint(x: 50, y: 20))
        path.stroke()
    }

    override init(frame: CGRect) {
        titleLabel = UILabel(frame: CGRect(x: 50.0, y: 20.0, width: frame.size.width - 60.0, height: 20.0))
        titleLabel.textColor = TrelloLightGray
        titleLabel.font = UIFont.boldSystemFontOfSize(14.0)
        super.init(frame: frame)
        backgroundColor = TrelloGray
        let bottomLine = UIView(frame: CGRect(x: 0, y: height - 1.0, width: width, height: 1.0))
        bottomLine.backgroundColor = TrelloLightGray
        addSubviews(titleLabel, bottomLine)
        
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.TopLeft, .TopRight], cornerRadii: CGSize(width: 5, height: 5))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.CGPath
        layer.mask = maskLayer
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
