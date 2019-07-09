//
//  ResponseObject.swift
//  Artic
//
//  Created by admin on 09/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation

struct ResponseObject<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: T?
}
