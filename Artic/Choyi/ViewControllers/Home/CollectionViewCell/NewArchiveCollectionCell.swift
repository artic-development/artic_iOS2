//
//  newArchiveCollectionCell.swift
//  Artic
//
//  Created by admin on 03/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

protocol newArchiveProtocol:class {
    func pushToNewArchiveArticle(withData:Int, isScrap: Bool)
}

class NewArchiveCollectionCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryName2: UILabel!
    @IBOutlet weak var articleTitle: UITextView!
    
    override func awakeFromNib() {
        backView.makeRounded(cornerRadius: 6)
        
    }
    
}
