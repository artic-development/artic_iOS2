//
//  NetworkResult.swift
//  Artic
//
//  Created by admin on 07/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

enum NetworkResult<T> {
    // 통신의 상태에 대한 분기 코드입니다.
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
