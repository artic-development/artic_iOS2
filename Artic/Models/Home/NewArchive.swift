//
//  archiveData.swift
//  Artic
//
//  Created by admin on 02/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation

struct NewArchive: Codable  {
    let archive_idx: Int
    let user_idx: Int
    let archive_title: String
    let date: String
    let archive_img: String
    let category_idx: Int
    let article_cnt: Int
    let category_all: [CategoryAll]
    let scrap: Bool
}


