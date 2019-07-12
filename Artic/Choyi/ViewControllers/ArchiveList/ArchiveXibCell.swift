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
    var tagList: [String] = ["",""]
    var archiveIdxNum = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        articleNumLabel.text = "3개"
        tagListView.textFont = UIFont(name: "NanumBarunGothic", size: 11.0)!
        //tagListView.addTags([tagList[0], tagList[1]])
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
            
            addArchive(archiveIdx: archiveIdxNum)
            
            
        }else{
            //저장 취소
            storeBtn.setImage(UIImage(named: "btnScrapFilledBig"), for: .normal)
            isStored = false
            
            addArchive(archiveIdx: archiveIdxNum)
        }
        
    }
    
    func addArchive(archiveIdx: Int){
        AddArchiveService.shared.addArchive(archiveIdx: archiveIdx) {
            data in
            
            switch data {
            case .success(let token):
                let _token = token as! AddArchive
                //print(_token.token)
                
               print("아아아아아ㅏㅇ아악")
                
                break
            case .requestErr(let err):
                break
            case .pathErr:
                // 대체로 경로를 잘못 쓴 경우입니다.
                // 오타를 확인해보세요.
                print("경로 에러")
                break
            case .serverErr:
                // 서버의 문제인 경우입니다.
                // 여기에서 동작할 행동을 정의해주시면 됩니다.
                print("서버 에러")
                break
            case .networkFail:
                break
            }
        }
    }
    
}
