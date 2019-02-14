//
//  TrelloListCellViewModel.swift
//  TrelloNavigation
//
//  Created by DianQK on 15/11/10.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

typealias UpdateCell = ([UIView]) -> [UIView]

public struct TrelloListCellViewModel {
    public static func updateCell(item: TrelloListCellItem, cell: TrelloListTableViewCell) -> UITableViewCell {
        cell.contentLabel.text = item.content
        cell.colorIndicatorView.backgroundColor = item.type.color()
        cell.item = item
        return cell
    }
    
    public static func initCell(item: TrelloListCellItem, style: UITableViewCell.CellStyle = .default, reuseIdentifier: String) -> UITableViewCell {
        let cell = TrelloListTableViewCell(style: style, reuseIdentifier: reuseIdentifier)
        cell.contentLabel.text = item.content
        cell.colorIndicatorView.backgroundColor = item.type.color()
        cell.item = item
        return cell
    }
}
