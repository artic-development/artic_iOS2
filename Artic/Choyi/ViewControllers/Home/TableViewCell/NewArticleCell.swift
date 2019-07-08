//
//  newArticleCell.swift
//  Artic
//
//  Created by admin on 03/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import Kingfisher

class NewArticleCell: UITableViewCell {
    
    var newArticleList: [NewArticle] = []
    @IBOutlet weak var newArticleCV: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        getNewArticle()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getNewArticle() {
        
        NewArticleService.shared.getNewArticle() {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! [NewArticle]
                self.newArticleList = _result
                self.newArticleCV.reloadData()
                //print(result)
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }

}

extension NewArticleCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //개수
        return newArticleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewArticleCollectionCell", for: indexPath) as! NewArticleCollectionCell
        
        let newArticle = newArticleList[indexPath.row]
        
        //아티클 제목
        cell.articleTitle.text = "\(newArticle.article_title)"
        
        //아티클 썸네일
        let url = URL(string: newArticle.thumnail)
        cell.newArticleImg.kf.setImage(with: url)
            
        //아티클 웹 라벨 텍스트
        cell.webLabel.text? = "\(newArticle.link)"
        
        return cell
    }
}
