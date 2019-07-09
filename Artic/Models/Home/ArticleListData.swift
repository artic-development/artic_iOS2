//
//  ArticleList.swift
//  Artic
//
//  Created by admin on 09/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation

struct ArticleListData: Codable {
    let archive_idx: Int?
    let user_idx: Int?
    let archive_title: String?
    let date: String?
    let archive_img: String?
    let category_idx: Int?
    let articles: [Articles]?
}
