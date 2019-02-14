//
//  TrelloListTableViewCell.swift
//  TrelloNavigation
//
//  Created by DianQK on 15/11/10.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

public class TrelloListTableViewCell: UITableViewCell {
    
    var bgView: UIView?
    var colorIndicatorView: UIView
    var contentLabel: UILabel
    var detailImageView: UIImageView
    public var item: TrelloListCellItem?
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        detailImageView = UIImageView(frame: CGRect.zero)
        detailImageView.contentMode = .scaleAspectFill
        detailImageView.layer.masksToBounds = true
        
        contentLabel = UILabel(frame: CGRect.zero)
        contentLabel.textColor = TrelloLightGray
        contentLabel.font = UIFont.systemFont(ofSize: 15.0)
        
        colorIndicatorView = UIView(frame: CGRect.zero)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bgView = UIView(frame: CGRect(x: 10.0, y: 5.0, width: width - 20.0, height: height - 5.0))
        if let bgView = bgView {
            bgView.backgroundColor = UIColor.white
            bgView.layer.masksToBounds = true
            bgView.layer.cornerRadius = 5.0
            addSubview(bgView)
            bgView.addSubviews(detailImageView, contentLabel, colorIndicatorView)
        }
        
        selectionStyle = .none
        backgroundColor = TrelloGray
        
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        guard let item = item, let bgView = bgView else { return }
        bgView.frame = CGRect(x: 10.0, y: 5.0, width: width - 20.0, height: height - 5.0)
        if (item.image != nil) {
            detailImageView.frame = CGRect(x: 0, y: 0, width: width, height: 160.0)
            detailImageView.image = item.image
            colorIndicatorView.frame = CGRect.zero
            contentLabel.frame = CGRect(x: 15.0, y: detailImageView.bottom + 10.0, width: width - 30.0, height: 20.0)
        } else {
            detailImageView.frame = CGRect.zero
            detailImageView.image = nil
            colorIndicatorView.frame = CGRect(x: 15.0, y: 20.0, width: 50.0, height: 4.0)
            colorIndicatorView.backgroundColor = item.type.color()
            contentLabel.frame = CGRect(x: 15.0, y: colorIndicatorView.bottom + 10.0, width: bgView.width + 30.0, height: 20.0)
            contentLabel.text = item.content
        }
        
    }

}
