//
//  TrelloListTableView.swift
//  TrelloNavigation
//
//  Created by DianQK on 15/11/8.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit



public class TrelloListTableView<T>: UITableView {
    
    public var listItems: [T]?
    public var headerDidFolded: HeaderDidFolded?
    public var tab: String?
    
    override public var contentOffset: CGPoint {
        willSet {
            if contentOffset.y != 0 {
                headerDidFolded?(contentOffset.y > 0)
            }
        }
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 30.0))
        footerView.backgroundColor = TrelloGray
        let maskPath = UIBezierPath(roundedRect: footerView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 5, height: 5))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = footerView.bounds
        maskLayer.path = maskPath.cgPath
        footerView.layer.mask = maskLayer
        tableFooterView = footerView
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
