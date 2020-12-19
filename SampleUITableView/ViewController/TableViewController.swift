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

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  private let cellClassName = "TableViewCell"
  private let reuseId = "TableViewCell"

  private let api = SampleAPI()
  private var users:[UserModel] = []
  private var heightCache: [CGFloat] = []

  @IBOutlet weak var indicator: UIActivityIndicatorView!
  @IBOutlet weak var tableView: UITableView! {
    didSet {

      /* セルの登録
       読み込ませたいセルの種類の数だけxibを用意してそれを登録するのが一般的
       xibを使わない場合などは登録方法が違う
       今時は便利なライブラリを使うがここではiOS標準機能だけで書いている
       */
      //xibファイルを読み込む
      let cellNib = UINib(nibName: cellClassName, bundle: nil)
      //このtableViewはこのセルを使いますよと登録する
      tableView.register(cellNib, forCellReuseIdentifier: reuseId)

      /*
       dataSourceとdelegateをどのViewControllerに任せるか
       普通はself
       autolayoutからも設定ができる
       */
//      tableView.dataSource = self
//      tableView.delegate = self

      /*
       推定の高さ
       固定の高さ

       tableViewはデフォルトでこのあたりを設定している
       autolayoutからも設定ができる

       細かく指定した方が画面はスムーズに動く
       */
//      tableView.estimatedRowHeight = 120
//      tableView.rowHeight = 120
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
      self.users = _users
      self.tableView.isHidden = false
      self.indicator.isHidden = true
      self.tableView.reloadData()
    }
  }


  /*
   絶対に実装を追加しないといけないのはこのふたつ
   残りのセクション数などはデフォルトになっている
   */

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? TableViewCell else {
      return UITableViewCell()
    }
    let user = users[indexPath.row]
    cell.configure(user: user)
    return cell
  }

  /*
   セルごとに高さを変える場合はこのfunctionを実装して計算する
   他に楽なやり方もある
   だけどどうしてもパフォーマンスチューニングをする必要がある時はここをうまくやる
   */
  //  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  //    /*ガリガリ計算してセルの高さ*/
  //    let user = users[indexPath.row]
  //    let height = TableViewCell.cellHeight(user: user)
  //    heightCache[indexPath.row] = height
  //
  //    return height
  //  }
}

