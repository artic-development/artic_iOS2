//
//  addArchive.swift
//  Artic
//
//  Created by admin on 12/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation
struct AddArchive: Codable {
    let fieldCount: Int
    let affectedRows: Int
    let insertId: Int
    let serverStatus: Int
    let warningCount: Int
    let message: String
    let protocol41: Bool
    let changedRows: Int
}
