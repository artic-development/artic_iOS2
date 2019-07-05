//
//  UINavigationController+Extentions.swift
//  Artic
//
//  Created by admin on 02/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func setNavigationBarBorderColor(_ color:UIColor) {
        self.navigationBar.shadowImage = color.as1ptImage()
    }
}

