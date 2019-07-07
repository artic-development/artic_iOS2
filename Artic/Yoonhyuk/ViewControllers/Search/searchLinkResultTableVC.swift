//
//  searchLinkResultTableVC.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 04/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import SafariServices
import WebKit

class searchLinkResultTableVC: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    
    
    

    var isClicked : Bool = true
    @IBOutlet weak var searchResult: UITableView!
    
    @IBOutlet weak var searchResultNum: UILabel!
    @IBOutlet weak var searchArchive: UIButton!
    @IBOutlet weak var searchArticle: UIButton!
    
    var searchNum : Int = 13
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchResult.delegate = self
        searchResult.dataSource = self
        
        searchResultNum.text = "\(searchNum)"
       
        let nibName = UINib(nibName: "ArticleCell", bundle: nil)
        
        searchResult.register(nibName, forCellReuseIdentifier: "ArticleCell")
        
        let nibName2 = UINib(nibName: "ArchiveXibCell", bundle: nil)
        searchResult.register(nibName2, forCellReuseIdentifier: "ArchiveXibCell")
      
        
        //검색결과 default
        searchArchive.setBackgroundImage(UIImage(named: "dotArchive"), for: .normal)
        searchArchive.setTitleColor( UIColor.blue, for: .normal)
        searchArticle.setBackgroundImage(UIImage(named: "blankArticle"), for: .normal)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 이 부분은 아래 부분의 didSelectRowAt 부분을 먼저 읽고 다시 와주세요!
        
        /*
         didSelectRowAt 함수에서 해당 셀을 선택하고 음악 상세정보 뷰로 전환되었다가 다시 돌아오면
         그 셀이 선택된 상태로 남아 있는 현상을 해결합니다. (궁금하다면 이 부분을 주석처리하고 실행해보세요!)
         viewDidDisappear 안에 선언되어 뷰가 다시 나타날 때 아래 코드가 실행되고
         현재 선택된 row 의 인덱스를 가져와 그 인덱스에 해당하는 row 를 이용해 deslect 를 해줍니다.
         */
        if let index = searchResult.indexPathForSelectedRow {
            searchResult.deselectRow(at: index, animated: true)
        }
    }
    
    @IBAction func archivePressed(_ sender: Any) {
        isClicked = true
        
        if searchArchive.currentTitleColor == UIColor.blue {
            
        }
        else{
            searchArchive.setTitleColor( UIColor.blue, for: .normal)
            searchArchive.setBackgroundImage(UIImage(named: "dotArchive"), for: .normal)
            searchArticle.setBackgroundImage(UIImage(named: "blankArticle"), for: .normal)
            searchArticle.setTitleColor(UIColor.black, for: .normal)
   
        }
        
        searchResult.reloadData()
        
    }
    
    @IBAction func articlePressed(_ sender: UIButton) {
        isClicked = false
        if searchArticle.currentTitleColor == UIColor.black{
           searchArticle.setBackgroundImage(UIImage(named: "dotArchive"), for: .normal)
            searchArticle.setTitleColor(UIColor.blue, for: .normal)
            
            searchArchive.setTitleColor( UIColor.black, for: .normal)
            searchArchive.setBackgroundImage(UIImage(named: "blankArticle"), for: .normal)
            
         
                }
        searchResult.reloadData()
            }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isClicked == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
            
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArchiveXibCell", for: indexPath) as! ArchiveXibCell
            return cell
            
        }
        
    }
    func tableView(_ tableview: UITableView,didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: "https://brunch.co.kr/@candits/43") else {
            return
        }
        let safariview = SFSafariViewController(url: url)
        present(safariview, animated: true, completion: nil)

       
        
        
        
        
      
 }
    
    
        
    
    
    }
    
   





        

