//
//  TrelloListCellItem.swift
//  TrelloNavigation
//
//  Created by 宋宋 on 15/11/9.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

public enum TrelloCellItemType: Int {
    case Green = 0
    case Orange
    case Red
    case Yellow
    case YellowAndOrange
    
    func color() -> UIColor {
        switch self {
        case .Green:
            return UIColor(red: 0, green: 100.0/255.0, blue: 0, alpha: 1.0)
        case .Orange:
            return UIColor.orangeColor()
        case .Red:
            return UIColor.redColor()
        case .Yellow:
            return UIColor.yellowColor()
        default :
            return UIColor(red: 0, green: 100.0/255.0, blue: 0, alpha: 1.0)
        }
    }
    
    static func type(type: String) -> TrelloCellItemType {
        switch type {
        case "Green":
            return .Green
        case "Orange":
            return .Orange
        case "Red":
            return .Red
        case "Yellow":
            return .Yellow
        default:
            return .Green
        }
    }
}

public struct TrelloListCellItem {
    public var image : UIImage?
    public var content : String
    public var type : TrelloCellItemType
    
    public init() {
        self.image = UIImage()
        self.content = ""
        self.type = .Green
    }
    
    public init(image: UIImage?, content: String, type: TrelloCellItemType) {
        self.image = image
        self.content = content
        self.type = type
    }
}