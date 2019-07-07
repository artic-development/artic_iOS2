//
//  ArticleCell.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 04/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import SafariServices

class ArticleCell: UITableViewCell {
    @IBOutlet weak var webLabel: UILabel!
    @IBOutlet weak var articleTitle: UITextView!
    
    @IBOutlet weak var viewRounding: UIView!
    @IBOutlet weak var articleImg: UIImageView!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var likeNum: UILabel!
    
    @IBOutlet weak var likeFolder: UIButton!
    var isClicked:Bool = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        viewRounding.makeRounded(cornerRadius: 6)
        
        //아티클 제목 자동 줄바꿈
        
        //articleTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //articleTitle.sizeToFit()
        
        
    }

    @IBAction func pressedLikeBtn(_ sender: Any) {
        isClicked = !isClicked
        if isClicked == true {
            likeBtn.setImage(UIImage(named: "btnLikeFilled"), for: .normal)
            likeNum.textColor = UIColor.init(red: 79/255.0, green: 128/255.0, blue: 255/255.0, alpha: 1.0)
            
        }else{
            likeBtn.setImage(UIImage(named: "btnLike"), for: .normal)
             likeNum.textColor = UIColor.init(red: 112/255.0, green: 112/255.0, blue: 112/255.0, alpha: 1.0)
        
        
        
        }
        
    
        
    }
    
    
    @IBAction func pressedLikeFolder(_ sender: Any) {
       //색 안변하고 밑에서 토스트
       
    }
    
        
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     
        
      
            
            
            
        
        

        
    }
    
    
   
        // Configure the view for the selected state
    
    
}
