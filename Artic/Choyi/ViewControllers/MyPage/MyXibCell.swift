//
//  MyXibCell.swift
//  Artic
//
//  Created by admin on 05/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class MyXibCell: UITableViewCell {
    @IBOutlet weak var leftCellView: UIView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftTitle: UILabel!
    
    @IBOutlet weak var rightCellView: UIView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightTitle: UILabel!
    
    
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
