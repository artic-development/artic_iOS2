//
//  archiveDataSample.swift
//  Artic
//
//  Created by admin on 02/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation

final class archiveDataSample {
    
    static func generateArchiveData() -> [archiveData] {
        return [
            archiveData(title: "가나다라마바사아자차카", stored: true, tagNum: 2, articleNum: 13, tags: ["디자인", "UX/UI"]),
            archiveData(title: "아틱아틱", stored: false, tagNum: 2, articleNum: 20, tags: ["디자인", "매니지먼트"]),
            archiveData(title: "개발자디자이너개발뱁가잭", stored: true, tagNum: 1, articleNum: 1, tags: ["브랜딩"]),
            archiveData(title: "키키캨내랴쥬댜혀배주챋", stored: false, tagNum: 1, articleNum: 5, tags: ["아틱"]),
            archiveData(title: "가고노다래주햐데재우래즈으데니르데이", stored: true, tagNum: 2, articleNum: 17, tags: ["디자인", "UX/UI"])
        ]
    }
}
