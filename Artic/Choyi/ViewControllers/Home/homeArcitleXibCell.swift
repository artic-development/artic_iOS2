//
//  homeArcitleXibCell.swift
//  Artic
//
//  Created by admin on 05/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class homeArcitleXibCell: UITableViewCell {
    @IBOutlet weak var homeArticleView: UIView!
    @IBOutlet weak var homeArticleImg: UIImageView!
    @IBOutlet weak var homeArticleTitle: UITextView!
    @IBOutlet weak var homeArticleWebLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        homeArticleView.makeRounded(cornerRadius: 6)
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
