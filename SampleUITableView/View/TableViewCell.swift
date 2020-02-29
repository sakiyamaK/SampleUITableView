//
//  TableCell.swift
//  SampleUITableView
//
//  Created by sakiyamaK on 2020/02/27.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var contentsImageView: UIImageView!

    func configure(user: UserModel) {
        //本当はapi通信してアイコン画像を読み込む
        if let iconImageUrlStr = user.icon {
	        //iconView = ~~~~
        }

        nameLabel.text = user.name
        mainTextLabel.text = user.mainText

        //本当はapi通信してコンテンツの画像を読み込む
        if let cotentImageURLStr = user.image {
            //contentsImageView
        } else {
            contentsImageView.isHidden = true
        }
    }

}
