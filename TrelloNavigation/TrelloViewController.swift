//
//  ViewController.swift
//  TrelloNavigation
//
//  Created by DianQK on 15/11/8.
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
                TrelloListTabViewModel.tabView(title: "BACKLOG", level: 3),
                TrelloListTabViewModel.tabView(title: "BRIEFS", level: 5),
                TrelloListTabViewModel.tabView(title: "DESIGN", level: 2),
                TrelloListTabViewModel.tabView(title: "USER TESTING", level: 4),
                TrelloListTabViewModel.tabView(title: "USER TESTIN", level: 1)
            ]
        })
        
        if let trelloView = trelloView {
            view.addSubviews(trelloView)
            trelloView.delegate = self
            trelloView.dataSource = self
            
            var i = 0
            for tableView in trelloView.tableViews {
                guard let tableView = tableView as? TrelloListTableView<TrelloListCellItem> else { return }
                tableView.register(TrelloListTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
                tableView.tab = trelloView.tabs[i]
                tableView.listItems = TrelloData.data[i]
                i += 0
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = TrelloBlue
        _ = navigationController?.navigationBar.subviews.first?.subviews.map { view in
            if view is UIImageView {
                view.isHidden = true
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableView = tableView as? TrelloListTableView<TrelloListCellItem>,
            let count = tableView.listItems?.count
            else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let tableView = tableView as? TrelloListTableView<TrelloListCellItem> else { fatalError("TableView False") }
        guard let item = tableView.listItems?[indexPath.row] else { fatalError("No Data") }
        
        return (item.image != nil) ? 220.0 : 80.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TrelloListSectionView(frame: CGRect(x: 0, y: 0, width: tableView.width, height: 60.0))
        guard let tableView = tableView as? TrelloListTableView<TrelloListCellItem> else { return view }
        view.title = tableView.tab ?? ""
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableView = tableView as? TrelloListTableView<TrelloListCellItem> else { fatalError("TableView False") }
        guard let item = tableView.listItems?[indexPath.row] else { fatalError("No Data") }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TrelloListTableViewCell else {
            return TrelloListCellViewModel.initCell(item: item, reuseIdentifier: reuseIdentifier)
        }
        return TrelloListCellViewModel.updateCell(item: item, cell: cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TrelloListTableViewCell else { return }
        let alertViewController = UIAlertController(title: cell.item?.content, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) -> Void in

        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in

        }
        alertViewController.addAction(cancelAction)
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
