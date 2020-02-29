//
//  UserModel.swift
//  SampleUITableView
//
//  Created by sakiyamaK on 2020/02/29.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

struct UserModel: Codable {
    var id: Int
    var icon: String?
    var name: String
    var mainText: String
    var image: String?
}
