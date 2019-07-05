//
//  cateArchiveCell.swift
//  Artic
//
//  Created by admin on 03/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
//킥플립

class CateArchiveCell: UITableViewCell {
    @IBOutlet weak var backView1: UIView!
    @IBOutlet weak var backView2: UIView!
    @IBOutlet weak var backView3: UIView!
    @IBOutlet weak var backView4: UIView!
    
    @IBOutlet weak var backImg1: UIImageView!
    @IBOutlet weak var backImg2: UIImageView!
    @IBOutlet weak var backImg3: UIImageView!
    @IBOutlet weak var backImg4: UIImageView!
    
    @IBOutlet weak var archiveTitle1: UITextView!
    @IBOutlet weak var archiveTitle2: UITextView!
    @IBOutlet weak var archiveTitle3: UITextView!
    @IBOutlet weak var archiveTitle4: UITextView!
    
    @IBOutlet weak var numLabel1: UILabel!
    @IBOutlet weak var numLabel2: UILabel!
    @IBOutlet weak var numLabel3: UILabel!
    @IBOutlet weak var numLabel4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backView1.makeRounded(cornerRadius: 6)
        backView2.makeRounded(cornerRadius: 6)
        backView3.makeRounded(cornerRadius: 6)
        backView4.makeRounded(cornerRadius: 6)
        
//        archiveTitle1.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
