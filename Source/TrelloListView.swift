//
//  TrelloListView.swift
//  TrelloNavigation
//
//  Created by 宋宋 on 15/11/8.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

public typealias TrelloListCells = TrelloCells

public class TrelloListView: UIScrollView {
    
    public var listCount: Int
    public var headerDidFolded: HeaderDidFolded?

    public init(frame: CGRect, index: Int = 0, listCount: Int) {
        self.listCount = listCount
        super.init(frame: frame)
        pagingEnabled = true
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        contentSize = CGSize(width: CGFloat(listCount) * (ScreenWidth - 45.0), height: height)
        contentOffset = CGPoint(x: 0, y: 0)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
