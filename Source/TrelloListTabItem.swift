//
//  TrelloListItem.swift
//  TrelloNavigation
//
//  Created by DianQK on 15/11/9.
//  Copyright © 2015年 Qing. All rights reserved.
//

import Foundation

public struct TrelloListTabItem {
    public var title : String
    public var heightLevel : Int
    
    public  init() {
        self.title = ""
        self.heightLevel = 0
    }
    
    public init(title: String, heightLevel: Int) {
        self.title = title
        self.heightLevel = heightLevel
    }
}
