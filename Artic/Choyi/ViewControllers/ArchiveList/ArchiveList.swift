//
//  ArchiveList.swift
//  Artic
//
//  Created by admin on 02/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class ArchiveList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var archiveTable: UITableView!
    
    //var archiveTableViewData = archiveDataSample.generateArchiveData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        archiveTable.delegate = self
        archiveTable.dataSource = self
        let nibName = UINib(nibName: "ArchiveXibCell", bundle: nil)
        
        
        archiveTable.register(nibName, forCellReuseIdentifier: "ArchiveXibCell")
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArchiveXibCell", for: indexPath) as? ArchiveXibCell else {return UITableViewCell()}
//        cell.titleLabel.text = archiveTableViewData[indexPath.row].title
//        if (archiveTableViewData[indexPath.row].stored == true){
////            cell.storedImageView.image = UIImage.init(named: "btnScrapFilledBig")
//        }else{
////            cell.storedImageView.image = UIImage.init(named: "btnScrapBig")
//        }
//        cell.articleNumLabel.text = "\(archiveTableViewData[indexPath.row].articleNum)개"
        return cell
    }

}
