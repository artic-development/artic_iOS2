//
//  CategoryList.swift
//  Artic
//
//  Created by admin on 26/06/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var subTitle = String()
    var sectionData = [String]()
    
    
}

class CategoryList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableViewData = [cellData]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.setNavigationBarBorderColor(UIColor.white)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.cellLayoutMarginsFollowReadableWidth = false
        tableView.separatorInset.left = 0
        
        
        tableViewData = [cellData(opened: false, title: "Design", subTitle: "디자인", sectionData: ["UX / UI", "BX", "그래픽", "영상 / 모션"]),
                         cellData(opened: false, title: "Plan", subTitle: "서비스 기획", sectionData: ["UX / UI", "BX", "그래픽", "영상 / 모션"]),
                         cellData(opened: false, title: "Management", subTitle: "매니지먼트", sectionData: ["UX / UI", "BX", "그래픽", "영상 / 모션"]),
                         cellData(opened: false, title: "Branding", subTitle: "브랜딩", sectionData: ["UX / UI", "BX", "그래픽", "영상 / 모션"]),
                         cellData(opened: false, title: "HR", subTitle: "인적 자원 관리", sectionData: ["UX / UI", "BX", "그래픽", "영상 / 모션"])]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataIndex = indexPath.row - 1
        
        if indexPath.row == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListCell", for: indexPath) as? CategoryListCell else {return UITableViewCell()}
            cell.titleLabel.text = tableViewData[indexPath.section].title
            cell.subtitleLabel.text = tableViewData[indexPath.section].subTitle
            return cell
        } else {
            //필요시 다른 identifier
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListSubCell") as? CategoryListSubCell else {return UITableViewCell()}
            cell.smallTitleLabel.text = tableViewData[indexPath.section].sectionData[dataIndex]
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0);
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true{
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
                for sectionNum in 0...tableViewData.count-1 {
                    if sectionNum != indexPath.section{
                        tableViewData[sectionNum].opened = false
                        let sections = IndexSet.init(integer: sectionNum)
                        tableView.reloadSections(sections, with: .none)
                    }
                }
            }
        }
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 58;
            } else {
            return 48;
            }
        }
    }
    

    
    

