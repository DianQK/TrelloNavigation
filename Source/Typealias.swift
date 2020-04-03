//
//  Typealias.swift
//  TrelloNavigation
//
//  Created by Marc Steven on 2020/4/3.
//  Copyright © 2020 Qing. All rights reserved.
//

import UIKit


public typealias TrelloCells = () -> [UIView]

public typealias TrelloListCells = TrelloCells

public typealias HeaderDidFolded = (Bool) -> Void

public typealias TrelloTabCells = TrelloCells
public typealias LayoutViews = ([UIView]) -> [UIView]
public typealias ClickIndex = (Int) -> ()

public typealias Unfolded = (Bool) -> Void

typealias TransformPoint = (CGPoint) -> CGPoint
