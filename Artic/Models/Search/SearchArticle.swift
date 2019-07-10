//
//  SearchArticle.swift
//  Artic
//
//  Created by admin on 11/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation
struct SearchArticle: Codable {
    let article_idx: Int
    let article_title: String
    let thumnail: String
    let link: String
    let domain: String
    let date: String
    let hits: Int
    let pick: Int
    let like: Bool
    let like_cnt: Int
}
