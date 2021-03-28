//
//  ViewController.swift
//  SampleUITableView
//
//  Created by sakiyamaK on 2020/02/27.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

/*
 TableViewを使う時に
 UITableViewDataSource, UITableViewDelegate
 のふたつのprotocolはほぼ必須で付ける
 (と言いつつ、最近はUITableViewDelegateの出番が減ってきた

 UITableViewDataSourceはデータの数やセルの更新など「表示」に関わる実装
 UITableViewDelegateはセルをタップしたなど「動き」に関わる実装
 */

class TestHeader: UITableViewHeaderFooterView {

  func configure(color: UIColor = .red) {
    self.contentView.backgroundColor = color
  }

  override func prepareForReuse() {
    super.prepareForReuse()
  }

}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  private let cellClassName = "TableViewCell"
  private let reuseId = "TableViewCell"

  private let api = SampleAPI()
  private var userss:[[UserModel]] = [[], [], []]
  private var heightCache: [CGFloat] = []

  private var visibleHeaders: [Int: TestHeader] = .init()
  private var lastContentOffset: CGFloat = 0
  private var isScrollDown: Bool = false

  @IBOutlet weak var indicator: UIActivityIndicatorView!
  @IBOutlet weak var tableView: UITableView! {
    didSet {
      //xibファイルを読み込む
      let cellNib = UINib(nibName: cellClassName, bundle: nil)
      //このtableViewはこのセルを使いますよと登録する
      tableView.register(cellNib, forCellReuseIdentifier: reuseId)

      tableView.register(TestHeader.self, forHeaderFooterViewReuseIdentifier: "header")
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    //api通信してテーブルをリロード

    api.getHome { (users, error) in
      if let _error = error {
        //api通信エラーが起きた時の処理
        debugPrint(_error)
        return
      }
      guard let _users = users else {
        //apiは成功してるのにレスポンスが空の時
        return
      }
      //成功してたら代入してリロード
      self.userss = [_users, _users, _users]
      self.tableView.isHidden = false
      self.indicator.isHidden = true
      self.tableView.reloadData()
    }
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    self.userss.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userss[section].count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? TableViewCell else {
      return UITableViewCell()
    }
    let user = userss[indexPath.section][indexPath.row]
    cell.configure(user: user)
    return cell
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    print("viewForHeaderInSection \(section)")
    let view = TestHeader()
    view.configure()
    visibleHeaders[section] = view
    return view
  }


  func scrollViewDidScroll(_ scrollView: UIScrollView) {

    if (self.lastContentOffset > scrollView.contentOffset.y) {
      // move up
      isScrollDown = false
    }
    else if (self.lastContentOffset < scrollView.contentOffset.y) {
      // move down
      isScrollDown = true
    }

    // update the new position acquired
    self.lastContentOffset = scrollView.contentOffset.y
  }


  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    print("willDisplayHeaderView \(section)  \(isScrollDown)")
    if !isScrollDown, let header = visibleHeaders[section] {
      header.configure(color: .blue)
    }
    if let header = visibleHeaders[section + 1] {
      header.configure(color: .red)
    }
  }

  func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
//    removeVisibleHeaderIfPossible(for: view)
    if let header = visibleHeaders[section + 1] {
      header.configure(color: .blue)
    }
    print("didEndDisplayingHeaderView \(section)")
  }
}

