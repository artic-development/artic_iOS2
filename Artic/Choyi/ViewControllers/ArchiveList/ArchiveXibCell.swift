//
//  ArchiveXibCell.swift
//  Artic
//
//  Created by admin on 04/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import TagListView

class ArchiveXibCell: UITableViewCell {

    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var archiveTitle: UITextView!
    @IBOutlet weak var storeBtn: UIButton!
    @IBOutlet weak var articleNumLabel: UILabel!
    var isStored = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        articleNumLabel.text = "3개"
        tagListView.textFont = UIFont(name: "NanumBarunGothic", size: 11.0)!
        tagListView.addTags(["가", "two", "tags"])
        tagListView.paddingY = 5
        tagListView.paddingX = 11
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func storeBtnClicked(_ sender: Any) {
        
        if(isStored == false){
            //저장하기
            storeBtn.setImage(UIImage(named: "btnScrapBig"), for: .normal)
            isStored = true
        }else{
            //저장 취소
            storeBtn.setImage(UIImage(named: "btnScrapFilledBig"), for: .normal)
            isStored = false
        }
        
    }
    
}
