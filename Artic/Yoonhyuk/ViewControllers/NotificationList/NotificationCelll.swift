//
//  NotificationCelll.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class NotificationCelll: UITableViewCell {

    @IBOutlet weak var viewRounding: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewRounding.makeRounded(cornerRadius: 6)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
