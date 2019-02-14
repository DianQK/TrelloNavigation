//
//  TrelloData.swift
//  TrelloNavigation
//
//  Created by DianQK on 15/11/12.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

struct TrelloData {
    static let data: [[TrelloListCellItem]] = [
        [
            TrelloListCellItem(image: nil, content: "Login and Register function", type: .green),
            TrelloListCellItem(image: nil, content: "Upload and downLoad pictures", type: .yellow),
            TrelloListCellItem(image: UIImage(named: "testImage3"), content: "Have a pleasant afternoon", type: .red)
        ],
        [
            TrelloListCellItem(image: nil, content: "This is a Trello Navigation Demo", type: .green),
            TrelloListCellItem(image: nil, content: "Some of it have been organized", type: .yellow),
            TrelloListCellItem(image: nil, content: "Use it as a Library", type: .red),
            TrelloListCellItem(image: UIImage(named: "testImage3"), content: "Displayed content is random created", type: .orange)
        ],
        [
            TrelloListCellItem(image: nil, content: "Make the interface more beautiful", type: .green),
            TrelloListCellItem(image: UIImage(named: "testImage2"), content: "This feels awesome", type: .yellow)
        ],
        [
            TrelloListCellItem(image: nil, content: "Test this first demo", type: .green),
            TrelloListCellItem(image: nil, content: "Push project to github", type: .yellow),
            TrelloListCellItem(image: UIImage(named: "testImage1"), content: "Have a pleasant afternoon", type: .red)
        ],
        [
            TrelloListCellItem(image: UIImage(named: "testImage3"), content: "Have a pleasant afternoon", type: .red),
            TrelloListCellItem(image: nil, content: "Login and Register function", type: .green),
            TrelloListCellItem(image: nil, content: "Upload and downLoad pictures", type: .yellow)
        ]
    ]
}
