# TrelloNavigation

[https://dribbble.com/shots/2114816-Trello-Navigation](https://dribbble.com/shots/2114816-Trello-Navigation)

> 很喜欢 [SergioChan](https://github.com/SergioChan) 用 Objective-C 写的 [SCTrelloNavigation](https://github.com/SergioChan/SCTrelloNavigation) ，所以我尝试着用 Swift 写了一遍。

## Preview

## Environment

* Xcode 7.1 +
* iOS 8 +

## Intro & Usage

API 和 代码结构和 SCTrelloNavigation 有一定区别，定制化好一些，所以使用的时候代码写的会多一些~但使用起来仍然是 Easy Easy Easy，就像使用 UITableView 。

### CocoaPods

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'TrelloNavigation', '~> 0.9.1'˘
```

> 注意：使用 CocoaPods 可能会出现一些问题，稍后就会解决，目前 Busying 、、、:] ，感谢理解

### 初始化

```Swift
trelloView = TrelloView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), tabCount: 5, trelloTabCells: { () -> [UIView] in
            return [
                TrelloListTabViewModel.tabView("BACKLOG", level: 3),
                TrelloListTabViewModel.tabView("BRIEFS", level: 5),
                TrelloListTabViewModel.tabView("DESIGN", level: 2),
                TrelloListTabViewModel.tabView("USER TESTING", level: 4),
                TrelloListTabViewModel.tabView("USER TESTIN", level: 1)
            ]
        })
```

只需要多设置 tab 的数量和对应 tab 的 view 。

> 注意：tabCount 要和 tabCell 数量一致。

### 设置 delegate 和 dataSource

```Swift
trelloView.delegate = self
trelloView.dataSource = self
```

就和使用 UITableView 一样，和 UITableView 一样实现对应的协议即可~

### 将数据挂在 tableView 上

因为用了多个 tableView ，所以为了区别不同 tab 的数据，我这里将数据放在了对应的 tableView 上。当然，你也可以用自己喜欢的其他方法，如果有更好的想法，欢迎给我提 PR 。

## Tips

项目中 TrelloAnimate 、 TrelloDefine 、 TrelloFunction 、 TrelloListTableView 、 TrelloListTabView 、TrelloListView 、 TrelloView 、 UIViewExt 是必要文件。

为了安全性，挂在 tableView 的数据必须声明数组中的类型，最好不要直接改为 AnyObject 。:]

如果你对 Swift 或者函数式编程很感兴趣，欢迎阅读源码一起学习。:]

## License

MIT