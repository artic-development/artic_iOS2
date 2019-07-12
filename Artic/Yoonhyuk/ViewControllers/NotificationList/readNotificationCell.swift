//
//  readNotificationCell.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class readNotificationCell: UITableViewCell {
    @IBOutlet weak var ReadNotiTitle: UITextView!
    @IBOutlet weak var dateText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        ReadNotiTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        ReadNotiTitle.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
