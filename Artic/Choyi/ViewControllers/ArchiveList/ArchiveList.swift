//
//  ArchiveList.swift
//  Artic
//
//  Created by admin on 02/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class ArchiveList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //public var archiveTableViewData = [archiveData]()

    @IBOutlet weak var archiveTable: UITableView!
    
    var archiveTableViewData = archiveDataSample.generateArchiveData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        archiveTable.delegate = self
        archiveTable.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return archiveTableViewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArchiveListCell", for: indexPath) as? ArchiveListCell else {return UITableViewCell()}
        cell.titleLabel.text = archiveTableViewData[indexPath.row].title
        if (archiveTableViewData[indexPath.row].stored == true){
            cell.storedImageView.image = UIImage.init(named: "btnScrapFilledBig")
        }else{
            cell.storedImageView.image = UIImage.init(named: "btnScrapBig")
        }
        cell.articleNumLabel.text = "\(archiveTableViewData[indexPath.row].articleNum)개"
        return cell
    }

}
