//
//  CategoryList.swift
//  Artic
//
//  Created by admin on 26/06/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class CategoryList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var categories: [Category] = []
    var cateIdx: Int = 999// cateIdx 초기화
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.setNavigationBarBorderColor(UIColor.white)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.cellLayoutMarginsFollowReadableWidth = false
        tableView.separatorInset.left = 0
        
        getCategory()
    }
    
    func getCategory() {
        
        CategoryService.shared.getCategory() {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! [Category]
                self.categories = _result
                self.tableView.reloadData()
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
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Category = categories[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListCell", for: indexPath) as? CategoryListCell else {return UITableViewCell()}
            cell.titleLabel.text = "\(Category.category_title)"
        //cell 선택시 배경 색 지정
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView
        
            return cell

 }
     override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
       
        
        if let index = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: index, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "categorySB", bundle: nil)
        guard let dvc = storyboard.instantiateViewController(withIdentifier: "ArchiveList") as? ArchiveList
            else {return}
        
        dvc.category_idx = indexPath.row
        dvc.category_title = "\(categories[indexPath.row].category_title)"
        self.present(dvc, animated: true)
        
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 55;
}
}

    
    

