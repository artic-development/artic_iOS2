//
//  ArchiveListData.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 08/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation

struct ArchiveListData: Codable {
    let archive_idx: Int
    let user_idx: Int
    let archive_title: String
    let date: String
    let archive_img: String
    let category_idx: Int
    let article_cnt: Int
    let category_all: [CategoryAll]
}

