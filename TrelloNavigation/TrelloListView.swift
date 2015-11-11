//
//  TrelloListView.swift
//  TrelloNavigation
//
//  Created by 宋宋 on 15/11/8.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

typealias TrelloListCells = TrelloCells

class TrelloListView: UIScrollView {
    
    var isFoldMode = false
    var listCount: Int
    var headerDidFolded: HeaderDidFolded?

    init(frame: CGRect, index: Int = 0, listCount: Int) {
        self.listCount = listCount
        super.init(frame: frame)
        pagingEnabled = true
        contentSize = CGSize(width: CGFloat(listCount) * (ScreenWidth - 45.0), height: height)
        contentOffset = CGPoint(x: 0, y: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
