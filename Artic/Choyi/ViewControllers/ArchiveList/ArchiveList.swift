//
//  ArchiveList.swift
//  Artic
//
//  Created by admin on 02/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class ArchiveList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var backbtn: UIBarButtonItem!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    
    @IBOutlet weak var archiveTable: UITableView!
    var category_idx = 0//초기화
    var category_title = "fjfj"//초기화
    var archives : [ArchiveListData] = []
    
    
    //var archiveTableViewData = archiveDataSample.generateArchiveData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        archiveTable.delegate = self
        archiveTable.dataSource = self
        let nibName = UINib(nibName: "ArchiveXibCell", bundle: nil)
        
        
        archiveTable.register(nibName, forCellReuseIdentifier: "ArchiveXibCell")
       
        navigationBar.topItem?.title = "\(category_title)"
        navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "NanumBarunGothic", size: 20.0)!]
        navigationBar.barTintColor = UIColor.colorWithRGBHex(hex: 0xffffff9)
        
        print(category_idx)
        getArchive(cateidx: category_idx)
        
        
    }
    func getArchive(cateidx: Int) {
        
        CateArchiveService.shared.getCateArchive(cateIdx: cateidx) {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! [ArchiveListData]
                self.archives = _result
                self.archiveTable.reloadData()
                //print(result)
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("개지랄")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return archives.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let archives2 = archives[indexPath.row]
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArchiveXibCell", for: indexPath) as? ArchiveXibCell else {return UITableViewCell()}
       
        cell.archiveTitle.text = "\(archives2.archive_title)"
        cell.articleNumLabel.text = "\(archives2.article_cnt)개"
        if archives2.category_all.count == 2{ cell.tagListView.addTags(["\(archives2.category_all[0].category_title)","\(archives2.category_all[1].category_title)"])
        }
        else{
            cell.tagListView.addTag("\(archives2.category_all[0].category_title)")
        
        }
//        if newArchive.category_all.count == 2{
//            cell.categoryName.text = "\(newArchive.category_all[0].category_title)"
//            cell.categoryName2.text = "\(newArchive.category_all[1].category_title)"
//        }else if newArchive.category_all.count == 1{
//            cell.categoryName.text = "\(newArchive.category_all[0].category_title)"
//            cell.categoryName2.text = ""
//        }else{
//            cell.categoryName.text = ""
//            cell.categoryName2.text = ""
//        }
        
//        cell.tagList[1] = "\(archives3.category_all.category_title)"
// index out of range
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "homeSB", bundle: nil)
        guard let dvc = storyboard.instantiateViewController(withIdentifier: "HomeNewArchiveDetail") as? HomeNewArchiveDetail
            else {return}
        
        dvc.archiveIdx = archives[indexPath.row].archive_idx
        //self.present(dvc, animated: true)
        self.navigationController?.pushViewController(dvc, animated: true)
    }
        // dvc.category_title = "\(categories[indexPath.row].category_title)"
//        if (archiveTableViewData[indexPath.row].stored == true){
////            cell.storedImageView.image = UIImage.init(named: "btnScrapFilledBig")
//        }else{
////            cell.storedImageView.image = UIImage.init(named: "btnScrapBig")
//        }
//        cell.articleNumLabel.text = "\(archiveTableViewData[indexPath.row].articleNum)개"
        //
    
    
    
 
@IBAction func Backbtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
