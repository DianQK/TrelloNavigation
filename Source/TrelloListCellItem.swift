//
//  TrelloListCellItem.swift
//  TrelloNavigation
//
//  Created by DianQK on 15/11/9.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

public enum TrelloCellItemType {
    case green
    case orange
    case red
    case yellow
    case custom(color: UIColor)
    
    func color() -> UIColor {
        switch self {
        case .green:
            return UIColor(red: 0, green: 100.0/255.0, blue: 0, alpha: 1.0)
        case .orange:
            return .orange
        case .red:
            return .red
        case .yellow:
            return .yellow
        case let .custom(color):
            return color
        }
    }

}

public struct TrelloListCellItem {
    public let image : UIImage?
    public let content : String
    public let type : TrelloCellItemType
    
    public init() {
        self.image = UIImage()
        self.content = ""
        self.type = .green
    }
    
    public init(image: UIImage?, content: String, type: TrelloCellItemType) {
        self.image = image
        self.content = content
        self.type = type
    }
}
