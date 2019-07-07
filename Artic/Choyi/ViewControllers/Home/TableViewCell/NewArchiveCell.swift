//
//  newArchiveCell.swift
//  Artic
//
//  Created by admin on 03/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import Kingfisher

class NewArchiveCell: UITableViewCell {
    
    @IBOutlet weak var newArchiveCV: UICollectionView!
    var newArchiveList: [NewArchive] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        getNewArchive()
        print("\(newArchiveList.count)ss")
    }
    

    func getNewArchive() {
        
        NewArchiveService.shared.getNewArchive() {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! [NewArchive]
                self.newArchiveList = _result
                self.newArchiveCV.reloadData()
                print(result)
                
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
}

extension NewArchiveCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //개수

        print(newArchiveList.count)
        return newArchiveList.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewArchiveCollectionCell", for: indexPath) as! NewArchiveCollectionCell

        //아카이브 제목
        let newArchive = newArchiveList[indexPath.row]
        cell.articleTitle.text = "\(newArchive.archive_title)"
        cell.articleTitle.translatesAutoresizingMaskIntoConstraints = true
        cell.articleTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cell.articleTitle.sizeToFit()

        //카테고리 이름
        if newArchive.category_all.count == 2{
            cell.categoryName.text = "\(newArchive.category_all[0].category_title)"
            cell.categoryName2.text = "\(newArchive.category_all[1].category_title)"
        }else{
            cell.categoryName.text = "\(newArchive.category_all[0].category_title)"
            cell.categoryName2.text = ""
        }
        
        //배경 이미지
        let url = URL(string: newArchive.archive_img)
        // this downloads the image asynchronously if it's not cached yet
        cell.backgroundImg.kf.setImage(with: url)
    
    
        //cell.backgroundImg.image = UIImage(named: <#T##String#>)
    
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = 177
        let itemHeight = 239
        return CGSize(width: itemWidth, height: itemHeight)
    }

}
