//
//  recentArticleCell.swift
//  Artic
//
//  Created by admin on 03/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class RecentArticleCell: UITableViewCell {

    @IBOutlet weak var smallArchiveImgView: UIView!
    @IBOutlet weak var smallArchiveImg: UIImageView!
    @IBOutlet weak var webLabel: UILabel!
    @IBOutlet weak var articleTitle: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        smallArchiveImgView.makeRounded(cornerRadius: 6)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
