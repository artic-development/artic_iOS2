//
//  UIButton+Extensions.swift
//  Artic
//
//  Created by admin on 05/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    override open var isSelected: Bool {
        didSet {
            // clear background color when selected
            self.layer.backgroundColor = .none
        }
    }
    
}
