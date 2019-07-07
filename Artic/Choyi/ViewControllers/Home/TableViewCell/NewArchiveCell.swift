//
//  newArchiveCell.swift
//  Artic
//
//  Created by admin on 03/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class NewArchiveCell: UITableViewCell {
    
    var newArchiveList: [NewArchive] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        getNewArchive()
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
        
        let newArchive = newArchiveList[indexPath.row]
        cell.articleTitle.text = "\(newArchive.archive_title)"
        
        if newArchive.category_all?.count == 2{
//            cell.categoryName.text = newArchive.category_all[0]
//            cell.categoryName2.text = newArchive.category_all[1]
//        }else{
//            cell.categoryName.text = newArchive.category_all[0]
            cell.categoryName2.text = ""
        }
        
        
        //cell.backgroundImg.image = UIImage(named: <#T##String#>)
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let itemsPerRow:CGFloat = 4
//        let hardCodedPadding:CGFloat = 5
//        let itemWidth = 177
//        let itemHeight = 239
//        return CGSize(width: itemWidth, height: itemHeight)
//    }
    
}
