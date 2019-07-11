//
//  newArticleCollectionCell.swift
//  Artic
//
//  Created by admin on 03/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

protocol newArticleProtocol:class {
    func pushToNewArticleLink(withArticleIdx: Int)
}

class NewArticleCollectionCell: UICollectionViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var newArticleImg: UIImageView!
    @IBOutlet weak var articleTitle: UITextView!
    @IBOutlet weak var webLabel: UILabel!
    
    override func awakeFromNib() {
        backView.makeRounded(cornerRadius: 6)
        backView.setBorder(borderColor: UIColor(red: CGFloat(205 / 255.0), green: CGFloat(205 / 255.0), blue:CGFloat(205 / 255.0), alpha: CGFloat(alpha)), borderWidth: 0.5)
        
        
    }
    
}
