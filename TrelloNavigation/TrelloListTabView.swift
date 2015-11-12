//
//  TrelloListTabView.swift
//  TrelloNavigation
//
//  Created by 宋宋 on 15/11/8.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

typealias TrelloTabCells = TrelloCells
typealias LayoutViews = [UIView] -> [UIView]
typealias ClickIndex = Int -> ()

class TrelloListTabView: UIScrollView {
    
    var didClickIndex: ClickIndex?
    var tabs: [String] = []
    
    var selectedIndex : Int = 0 {
        didSet {
            TrelloAnimate.tabSelectedAnimate(self)
        }
    }
    
    init(frame: CGRect, trelloTabCells: TrelloTabCells) {
        
        super.init(frame: frame)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
//        scrollEnabled = false
        
        let layoutViews: LayoutViews = { views in
            var next: CGFloat = 70.0
            var i = 0
            return views.map { view in
                view.left = next
                next += view.width
                view.tag = 100000 + i
                i++
//                let tap = UITapGestureRecognizer(target: self, action: Selector("tapTab:"))
//                view.addGestureRecognizer(tap)
                return view
            }
        }
        
        contentSize = CGSize(width: 70.0 + CGFloat(trelloTabCells().count) * 30.0, height: height)
        addSubviews(layoutViews(trelloTabCells()))
        
        _ = subviews.map { tabCell in
            guard let tabCell = tabCell as? TrelloListTabItemView else { return }
            tabs.append(tabCell.titleLabel.text ?? "")
        }
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapTab:"))
        addGestureRecognizer(tap)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapTab(tap: UITapGestureRecognizer) {
        if let didClickIndex = didClickIndex {
            if let tag = pointForSubview(tap.locationInView(self))?.tag {
//                selectedIndex = tag - 100000
                didClickIndex(tag - 100000)
            } else {
                didClickIndex(selectedIndex)
            }
//            didClickIndex(selectedIndex)
//            if let tag = tap.view?.tag {
//                didClickIndex(tag - 100000)
//            } else {
//                didClickIndex(selectedIndex)
//            }
        }
        
    }

}


