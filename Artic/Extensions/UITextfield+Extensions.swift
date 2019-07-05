//
//  UITextfield+Extensions.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 02/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){ //왼쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    

}
