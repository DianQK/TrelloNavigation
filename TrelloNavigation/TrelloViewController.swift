//
//  ViewController.swift
//  TrelloNavigation
//
//  Created by 宋宋 on 15/11/8.
//  Copyright © 2015年 Qing. All rights reserved.
//

import UIKit

class TrelloViewController: UIViewController {
    
    var trelloView : TrelloView?
    
    private let reuseIdentifier = "TrelloListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TrelloDeepBlue
        
        trelloView = TrelloView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), tabCount: 5, trelloTabCells: { () -> [UIView] in
            return [
                TrelloListTabViewModel.tabView("BACKLOG", level: 3),
                TrelloListTabViewModel.tabView("BRIEFS", level: 5),
                TrelloListTabViewModel.tabView("DESIGN", level: 2),
                TrelloListTabViewModel.tabView("USER TESTING", level: 4),
                TrelloListTabViewModel.tabView("USER TESTIN", level: 1)
            ]
        })
        
        if let trelloView = trelloView {
            view.addSubviews(trelloView)
            trelloView.delegate = self
            trelloView.dataSource = self
            
            var i = 0
            for tableView in trelloView.tableViews {
                guard let tableView = tableView as? TrelloListTableView<TrelloListCellItem> else { return }
                tableView.registerClass(TrelloListTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
                tableView.tab = trelloView.tabs[i]
                i++
                tableView.listItems = [
                    // Set Data or Model For Cell
                    TrelloListCellItem(image: UIImage(named: "testImage1"), content: "He", type: .Green),
                    TrelloListCellItem(image: nil, content: "HEHEHE", type: .Green)
                ]
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.barTintColor = TrelloBlue
        _ = navigationController?.navigationBar.subviews.first?.subviews.map { view in
            if view is UIImageView {
                view.hidden = true
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension TrelloViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableView = tableView as? TrelloListTableView<TrelloListCellItem>,
            count = tableView.listItems?.count
            else { return 0 }
        return count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        guard let tableView = tableView as? TrelloListTableView<TrelloListCellItem> else { fatalError("TableView False") }
        guard let item = tableView.listItems?[indexPath.row] else { fatalError("No Data") }
        
        return (item.image != nil) ? 220.0 : 80.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TrelloListSectionView(frame: CGRect(x: 0, y: 0, width: tableView.width, height: 60.0))
        guard let tableView = tableView as? TrelloListTableView<TrelloListCellItem> else { return view }
        view.title = tableView.tab ?? ""
        return view
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let tableView = tableView as? TrelloListTableView<TrelloListCellItem> else { fatalError("TableView False") }
        guard let item = tableView.listItems?[indexPath.row] else { fatalError("No Data") }
        guard let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as? TrelloListTableViewCell else {
            return TrelloListCellViewModel.initCell(item, reuseIdentifier: reuseIdentifier)
        }
        return TrelloListCellViewModel.updateCell(item, cell: cell)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) as? TrelloListTableViewCell else { return }
        let alertViewController = UIAlertController(title: cell.item?.content, message: nil, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in

        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in

        }
        alertViewController.addAction(cancelAction)
        alertViewController.addAction(okAction)
        presentViewController(alertViewController, animated: true, completion: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
