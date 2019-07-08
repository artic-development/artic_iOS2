//
//  NewArticle.swift
//  Artic
//
//  Created by admin on 08/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation

struct NewArticle: Codable {
    let article_idx: Int
    let article_title: String
    let thumnail: String
    let link: String
    let date: String
    let hits, pick: Int
}
