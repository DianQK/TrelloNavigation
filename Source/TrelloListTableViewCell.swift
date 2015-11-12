//
//  TrelloListTableViewCell.swift
//  TrelloNavigation
//
//  Created by 宋宋 on 15/11/10.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

public class TrelloListTableViewCell: UITableViewCell {
    
    var bgView: UIView?
    var colorIndicatorView: UIView
    var contentLabel: UILabel
    var detailImageView: UIImageView
    public var item: TrelloListCellItem?
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        detailImageView = UIImageView(frame: CGRectZero)
        detailImageView.contentMode = .ScaleAspectFill
        detailImageView.layer.masksToBounds = true
        
        contentLabel = UILabel(frame: CGRectZero)
        contentLabel.textColor = TrelloLightGray
        contentLabel.font = UIFont.systemFontOfSize(15.0)
        
        colorIndicatorView = UIView(frame: CGRectZero)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bgView = UIView(frame: CGRect(x: 10.0, y: 5.0, width: width - 20.0, height: height - 5.0))
        if let bgView = bgView {
            bgView.backgroundColor = UIColor.whiteColor()
            bgView.layer.masksToBounds = true
            bgView.layer.cornerRadius = 5.0
            addSubview(bgView)
            bgView.addSubviews(detailImageView, contentLabel, colorIndicatorView)
        }
        
        selectionStyle = .None
        backgroundColor = TrelloGray
        
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        guard let item = item, bgView = bgView else { return }
        bgView.frame = CGRect(x: 10.0, y: 5.0, width: width - 20.0, height: height - 5.0)
        if (item.image != nil) {
            detailImageView.frame = CGRect(x: 0, y: 0, width: width, height: 160.0)
            detailImageView.image = item.image
            colorIndicatorView.frame = CGRectZero
            contentLabel.frame = CGRect(x: 15.0, y: detailImageView.bottom + 10.0, width: width - 30.0, height: 20.0)
        } else {
            detailImageView.frame = CGRectZero
            detailImageView.image = nil
            colorIndicatorView.frame = CGRect(x: 15.0, y: 20.0, width: 50.0, height: 4.0)
            colorIndicatorView.backgroundColor = item.type.color()
            contentLabel.frame = CGRect(x: 15.0, y: colorIndicatorView.bottom + 10.0, width: bgView.width + 30.0, height: 20.0)
            contentLabel.text = item.content
        }
        
    }

}
