//
//  ResponseArray.swift
//  Artic
//
//  Created by admin on 07/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation

struct ResponseArray<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [T]
}
