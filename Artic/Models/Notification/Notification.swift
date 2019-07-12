//
//  notification.swift
//  Artic
//
//  Created by admin on 12/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation
struct Notification: Codable  {
    let articles: [notiArticles]
    let isRead: Bool
    let notification_type: String
    let notification_id: String
    let notification_date: String
}
