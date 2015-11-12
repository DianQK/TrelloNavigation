//
//  TrelloListTableView.swift
//  TrelloNavigation
//
//  Created by 宋宋 on 15/11/8.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

typealias HeaderDidFolded = (Bool) -> Void

public class TrelloListTableView<T>: UITableView {
    
    var listItems: [T]?
    var headerDidFolded: HeaderDidFolded?
    var tab: String?
    
    override public var contentOffset: CGPoint {
        willSet {
            if contentOffset.y != 0 {
                headerDidFolded?(contentOffset.y > 0)
            }
        }
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 30.0))
        footerView.backgroundColor = TrelloGray
        let maskPath = UIBezierPath(roundedRect: footerView.bounds, byRoundingCorners: [.BottomLeft, .BottomRight], cornerRadii: CGSize(width: 5, height: 5))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = footerView.bounds
        maskLayer.path = maskPath.CGPath
        footerView.layer.mask = maskLayer
        tableFooterView = footerView
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
