////
////  ArchiveListCell.swift
////  Artic
////
////  Created by admin on 02/07/2019.
////  Copyright © 2019 choyi. All rights reserved.
////
//
//import UIKit
//import TagListView
//
//class ArchiveListCell: UITableViewCell {
//
//    @IBOutlet weak var tagListView: TagListView!
//    @IBOutlet weak var titleLabel: UITextView!
//    @IBOutlet weak var storedImageView: UIImageView!
//    @IBOutlet weak var articleNumLabel: UILabel!
//    @IBOutlet weak var storeBtn: UIButton!
//    var isStored = true
//    
//    
//    
//    var archiveData = archiveDataSample.generateArchiveData()
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        
//        tagListView.textFont = UIFont(name: "NanumBarunGothic", size: 11.0)!
//        tagListView.addTags(["가", "two", "tags"])
//        tagListView.paddingY = 5
//        tagListView.paddingX = 11
//    }
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    
//    @IBAction func storeBtnClicked(_ sender: Any) {
//        
//        if(isStored == false){
//            //저장하기
//            storeBtn.setImage(UIImage(named: "btnScrapBig"), for: .normal)
//            isStored = true
//        }else{
//            //저장 취소
//            storeBtn.setImage(UIImage(named: "btnScrapFilledBig"), for: .normal)
//            isStored = false
//        }
//        
//    }
//}
