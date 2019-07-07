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
    
   





        
