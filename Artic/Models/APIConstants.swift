//
//  APIConstants.swift
//  Artic
//
//  Created by admin on 07/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

struct APIConstants {
    static let BaseURL = "http://15.164.11.203:3000"
    
    static let AuthURL = BaseURL + "/auth"
    static let SigninURL = AuthURL + "/signup"
    static let LoginURL = AuthURL + "/signin"
    
    static let SearchURL = BaseURL + "/search"
    
    static let HomeURL = BaseURL + "/home"
    static let HomeArtiURL = HomeURL + "/article"
    static let HomeArchURL = HomeURL + "/archive"
    
    static let CategoryURL = BaseURL + "/category"
    
    static let ArchiveURL = BaseURL + "/archive"
    
    static let MyPageURL = BaseURL + "/mypage"
    
    static let NotiURL = BaseURL + "/notification"
}
