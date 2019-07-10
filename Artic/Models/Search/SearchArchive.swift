//
//  SearchArchive.swift
//  Artic
//
//  Created by admin on 11/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation
struct SearchArchive: Codable {
    let archive_idx: Int
    let user_idx: Int
    let archive_title: String
    let date: String
    let archive_img: String
    let category_idx: Int
    let article_cnt: Int
    let scrap: Bool
    let category_all: [CategoryAll]
}
