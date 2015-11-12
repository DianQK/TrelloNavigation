//
//  TrelloData.swift
//  TrelloNavigation
//
//  Created by 宋宋 on 15/11/12.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

struct TrelloData {
    static let data: [[TrelloListCellItem]] = [
        [
            TrelloListCellItem(image: nil, content: "Login and Register function", type: .Green),
            TrelloListCellItem(image: nil, content: "Upload and downLoad pictures", type: .Yellow),
            TrelloListCellItem(image: UIImage(named: "testImage3"), content: "Have a pleasant afternoon", type: .Red)
        ],
        [
            TrelloListCellItem(image: nil, content: "This is a Trello Navigation Demo", type: .Green),
            TrelloListCellItem(image: nil, content: "Some of it have been organized", type: .Yellow),
            TrelloListCellItem(image: nil, content: "Use it as a Library", type: .Red),
            TrelloListCellItem(image: UIImage(named: "testImage3"), content: "Displayed content is random created", type: .Orange)
        ],
        [
            TrelloListCellItem(image: nil, content: "Make the interface more beautiful", type: .Green),
            TrelloListCellItem(image: UIImage(named: "testImage2"), content: "This feels awesome", type: .Yellow)
        ],
        [
            TrelloListCellItem(image: nil, content: "Test this first demo", type: .Green),
            TrelloListCellItem(image: nil, content: "Push project to github", type: .Yellow),
            TrelloListCellItem(image: UIImage(named: "testImage1"), content: "Have a pleasant afternoon", type: .Red)
        ],
        [
            TrelloListCellItem(image: UIImage(named: "testImage3"), content: "Have a pleasant afternoon", type: .Red),
            TrelloListCellItem(image: nil, content: "Login and Register function", type: .Green),
            TrelloListCellItem(image: nil, content: "Upload and downLoad pictures", type: .Yellow)
        ]
    ]
}