//
//  addArchiveCell.swift
//  Artic
//
//  Created by admin on 05/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class addArchiveCell: UICollectionViewCell {
    @IBOutlet weak var archiveImgView: UIView!
    
    override func awakeFromNib() {
        archiveImgView.makeRounded(cornerRadius: 6)
    }
    
}
