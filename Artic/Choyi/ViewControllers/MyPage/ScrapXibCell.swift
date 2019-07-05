//
//  ScrapXibCell.swift
//  Artic
//
//  Created by admin on 04/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class ScrapXibCell: UITableViewCell {
    @IBOutlet weak var leftArchiveCate1: UILabel!
    @IBOutlet weak var leftArchiveCate2: UILabel!
    @IBOutlet weak var leftArchiveTitle: UITextView!
    @IBOutlet weak var leftCellView: UIView!
    
    @IBOutlet weak var rightArchiveCate1: UILabel!
    @IBOutlet weak var rightArchiveCate2: UILabel!
    @IBOutlet weak var rightArchiveTitle: UITextView!
    @IBOutlet weak var rightCellView: UIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leftCellView.makeRounded(cornerRadius: 6)
        rightCellView.makeRounded(cornerRadius: 6)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
