//
//  newArticleCell.swift
//  Artic
//
//  Created by admin on 03/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class NewArticleCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension NewArticleCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //개수
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewArticleCollectionCell", for: indexPath) as! NewArticleCollectionCell
        return cell
    }
}
