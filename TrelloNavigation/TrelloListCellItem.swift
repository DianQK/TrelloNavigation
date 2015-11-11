//
//  TrelloListCellItem.swift
//  TrelloNavigation
//
//  Created by 宋宋 on 15/11/9.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

enum SCTrelloCellItemType: Int {
    case SCTrelloCellItemGreen = 0
    case SCTrelloCellItemOrange
    case SCTrelloCellItemRed
    case SCTrelloCellItemYellow
    case SCTrelloCellItemYellowAndOrange
    
    func color() -> UIColor {
        switch self {
        case .SCTrelloCellItemGreen:
            return UIColor(red: 0, green: 100.0/255.0, blue: 0, alpha: 1.0)
        case .SCTrelloCellItemOrange:
            return UIColor.orangeColor()
        case .SCTrelloCellItemRed:
            return UIColor.redColor()
        case .SCTrelloCellItemYellow:
            return UIColor.yellowColor()
        default :
            return UIColor(red: 0, green: 100.0/255.0, blue: 0, alpha: 1.0)
        }
    }
    
    static func type(type: String) -> SCTrelloCellItemType {
        switch type {
        case "Green":
            return .SCTrelloCellItemGreen
        case "Orange":
            return .SCTrelloCellItemOrange
        case "Red":
            return .SCTrelloCellItemRed
        case "Yellow":
            return .SCTrelloCellItemYellow
        default:
            return .SCTrelloCellItemGreen
        }
    }
}

public struct TrelloListCellItem {
    var image : UIImage?
    var content : String
    var type : SCTrelloCellItemType
    
    init() {
        self.image = UIImage()
        self.content = ""
        self.type = .SCTrelloCellItemGreen
    }
    
    init(image: UIImage?, content: String, type: SCTrelloCellItemType) {
        self.image = image
        self.content = content
        self.type = type
    }
}