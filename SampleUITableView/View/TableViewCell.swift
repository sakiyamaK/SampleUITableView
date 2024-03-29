//
//  TableCell.swift
//  SampleUITableView
//
//  Created by sakiyamaK on 2020/02/27.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet private var iconView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var mainTextLabel: UILabel!
    @IBOutlet private var contentsImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
        nameLabel.text = nil
        mainTextLabel.text = nil
        contentsImageView.image = nil
    }

    func configure(user: UserModel) {
        // 本当はapi通信してアイコン画像を読み込む
        if let iconImageUrlStr = user.icon {
            // iconView = ~~~~
        }

        nameLabel.text = user.name
        mainTextLabel.text = user.mainText

        // 本当はapi通信してコンテンツの画像を読み込む
        if let cotentImageURLStr = user.image {
            // contentsImageView
        } else {
            contentsImageView.isHidden = true
        }
    }

    static func cellHeight(user _: UserModel) -> CGFloat {
        /* 読み込むデータに対して高さだけ決める */
        return 1000
    }
}
