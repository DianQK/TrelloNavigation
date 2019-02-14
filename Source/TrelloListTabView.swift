//
//  TrelloListTabView.swift
//  TrelloNavigation
//
//  Created by DianQK on 15/11/8.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

public typealias TrelloTabCells = TrelloCells
public typealias LayoutViews = ([UIView]) -> [UIView]
public typealias ClickIndex = (Int) -> ()

public class TrelloListTabView: UIScrollView {
    
    public var didClickIndex: ClickIndex?
    public var tabs: [String] = []
    
    public var selectedIndex : Int = 0 {
        didSet {
            TrelloAnimate.tabSelectedAnimate(tabView: self)
        }
    }
    
    public init(frame: CGRect, trelloTabCells: TrelloTabCells) {
        
        super.init(frame: frame)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false

        let layoutViews: LayoutViews = { views in
            var next: CGFloat = 70.0
            return views.enumerated().map { (offset, element) -> UIView in
                element.left = next
                next += element.width
                element.tag = 100000 + offset
                return element
            }
        }
        
        contentSize = CGSize(width: 70.0 + CGFloat(trelloTabCells().count) * 30.0, height: height)
        addSubviews(layoutViews(trelloTabCells()))
        
        subviews.forEach { tabCell in
            guard let tabCell = tabCell as? TrelloListTabItemView else { return }
            tabs.append(tabCell.titleLabel.text ?? "")
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(TrelloListTabView.tapTab(_:)))
        addGestureRecognizer(tap)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapTab(_ tap: UITapGestureRecognizer) {
        if let didClickIndex = didClickIndex {
            if let tag = pointForSubview(point: tap.location(in: self))?.tag {
                didClickIndex(tag - 100000)
            } else {
                didClickIndex(selectedIndex)
            }
        }
    }

}


