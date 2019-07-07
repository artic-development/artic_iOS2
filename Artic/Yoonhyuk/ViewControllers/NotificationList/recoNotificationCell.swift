//
//  recoNotificationCell.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class recoNotificationCell: UITableViewCell {

    @IBOutlet weak var recoNoticell: UIView!
    @IBOutlet weak var viewRounding: UIView!
    
    @IBOutlet weak var RecoNotiTitle: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewRounding.makeRounded(cornerRadius: 6)
        RecoNotiTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        RecoNotiTitle.sizeToFit()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
