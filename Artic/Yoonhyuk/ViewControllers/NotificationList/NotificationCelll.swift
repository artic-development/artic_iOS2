//
//  NotificationCelll.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var NotiTitle: UITextView!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var viewRounding: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewRounding.makeRounded(cornerRadius: 6)
        NotiTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        NotiTitle.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
