//
//  String+Extensions.swift
//  Artic
//
//  Created by admin on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation

extension String {
    // 이메일 유효성 검사
    public func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
    
    // 비밀번호 유효성 검사
    public func validatePassword() -> Bool {
        let passwordRegEx = "^(?=.*[0-9])(?=.*[a-z]).{8,16}$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: self)
    }
    
    //이름 유효성 검사
//    public func validateName() -> Bool {
//        let nameRegEx = "^(?=.*[가-힣])(?=.*[a-z])(?=.*[A-Z]).{0.15}$"
//        
//        let predicate = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
//        return predicate.evaluate(with: self)
//    }
    
    //생일 유효성 검사
    public func validateBirth() -> Bool {
        let birthRegEx = "^([0-9]{2}) ([0-9]{2}) ([0-9]{2})*$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", birthRegEx)
        return predicate.evaluate(with: self)
    }
}
