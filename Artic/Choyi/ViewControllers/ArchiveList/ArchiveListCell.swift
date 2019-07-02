//
//  ArchiveListCell.swift
//  Artic
//
//  Created by admin on 02/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class ArchiveListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UITextView!
    @IBOutlet weak var storedImageView: UIImageView!
    @IBOutlet weak var articleNumLabel: UILabel!
    
    var archiveData = archiveDataSample.generateArchiveData()
    
    @IBOutlet weak var tagCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
