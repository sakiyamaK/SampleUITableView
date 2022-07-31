//
//  API.swift
//  SampleUITableView
//
//  Created by sakiyamaK on 2020/02/29.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

final class SampleAPI {
    func getHome(completion: (([UserModel]?, Error?) -> Void)? = nil) {
        // 本来はapi通信をして取得する
        // ここでは仮で３秒後にapiからレスポンスをもらった動きとする
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let jsonData = self.sampleData()
            guard let users = try? JSONDecoder().decode([UserModel].self, from: jsonData) else {
                completion?(nil, NSError(domain: "json error", code: 99, userInfo: nil))
                return
            }
            completion?(users, nil)
        }
    }
}

private extension SampleAPI {
    func sampleData() -> Data {
        return """
        [
            {
                "id":1,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"テストユーザ1",
                "mainText": "コロナで学校がお休みだーーーーわーーい！！！",
                "image":""
            },
            {
                "id":2,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"あいうえお",
                "mainText": "iOSプログラムなんも分からんオワタwwwwwwwww",
                "image":""
            },
            {
                "id":3,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"かきくけこ",
                "mainText": "test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test",
                "image":""
            },
            {
                "id":4,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"テストユーザ1",
                "mainText": "コロナで学校がお休みだーーーーわーーい！！！",
                "image":""
            },
            {
                "id":5,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"あいうえお",
                "mainText": "iOSプログラムなんも分からんオワタwwwwwwwww",
                "image":""
            },
            {
                "id":6,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"かきくけこ",
                "mainText": "test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test",
                "image":""
            },
            {
                "id":7,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"テストユーザ1",
                "mainText": "コロナで学校がお休みだーーーーわーーい！！！",
                "image":""
            },
            {
                "id":8,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"あいうえお",
                "mainText": "iOSプログラムなんも分からんオワタwwwwwwwww",
                "image":""
            },
            {
                "id":9,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"かきくけこ",
                "mainText": "test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test",
                "image":""
            },
            {
                "id":10,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"テストユーザ1",
                "mainText": "コロナで学校がお休みだーーーーわーーい！！！",
                "image":""
            },
            {
                "id":11,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"あいうえお",
                "mainText": "iOSプログラムなんも分からんオワタwwwwwwwww",
                "image":""
            },
            {
                "id":12,
                "icon":"https://1.bp.blogspot.com/-VL5hmfed8HY/XexqjpaLohI/AAAAAAABWg4/3mBq8_23ZqA1cETTqgeV_xtfc_LGGAtngCNcBGAsYHQ/s1600/hatake_tagayasu_woman.png",
                "name":"かきくけこ",
                "mainText": "test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test,test",
                "image":""
            }
        ]
        """.data(using: .utf8)!
    }
}
