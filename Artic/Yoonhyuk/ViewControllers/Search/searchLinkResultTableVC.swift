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
    
    
    
    var blackview: UIView!

    var isClicked : Bool = true
    @IBOutlet weak var searchResult: UITableView!
    
    @IBOutlet weak var searchResultKeyword: UILabel!
    @IBOutlet weak var searchResultNum: UILabel!
    @IBOutlet weak var searchArchive: UIButton!
    @IBOutlet weak var searchArticle: UIButton!
    @IBOutlet weak var Container: UIStackView!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    var searchNum : Int = 0
    var searchKeyword = ""
    var searchArchiveData : [SearchArchive] = []
    var searchArticleData : [SearchArticle] = []
    
    override func viewDidLoad() {
        
        searchResultKeyword.text = searchKeyword
       
        setBlackView()
        Container.transform = CGAffineTransform(translationX: 0, y: Container.frame.height)
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
        
        getSearchArchive(searchKeyword: searchKeyword)
        getSearchArticle(searchKeyword: searchKeyword)
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

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
        return searchArchiveData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isClicked == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
            
            let searchedArticle = searchArticleData[indexPath.row]
            cell.articleTitle.text = searchedArticle.article_title
            let url = URL(string: searchedArticle.thumnail)
            cell.articleImg.kf.setImage(with: url)
            cell.likeNum.text = "\(searchedArticle.like_cnt)"
            cell.webLabel.text = searchedArticle.domain
            
            
            cell.likeFolder.tag = indexPath.row
            cell.likeFolder.addTarget(self, action: #selector(self.book(_:)), for: .touchUpInside);
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArchiveXibCell", for: indexPath) as! ArchiveXibCell
            
            let searchedArchive = searchArchiveData[indexPath.row]
            
            cell.archiveTitle.text = "\(searchedArchive.archive_title)"
            cell.articleNumLabel.text = "\(searchedArchive.article_cnt)개"
            
            if searchedArchive.category_all.count == 2 {
                cell.tagList = [searchedArchive.category_all[0].category_title,searchedArchive.category_all[1].category_title]
                
                cell.tagListView.removeAllTags()
            cell.tagListView.addTags([searchedArchive.category_all[0].category_title,searchedArchive.category_all[1].category_title])
                
            }else if searchedArchive.category_all.count == 1 {
                cell.tagList = [searchedArchive.category_all[0].category_title]
                
                cell.tagListView.removeAllTags()
            cell.tagListView.addTag(searchedArchive.category_all[0].category_title)
            }else{
                cell.tagList = [""]
            }
            
            
            return cell
            
        }
      
    }
    @objc func book(_ sender: UIButton){
        showContainer()
    }
    func tableView(_ tableview: UITableView,didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: searchArticleData[indexPath.row].link) else {
            return
        }
        let safariview = SFSafariViewController(url: url)
        present(safariview, animated: true, completion: nil)


      
 }
    func setBlackView() {
        
        blackview = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        blackview.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        
        
        view.addSubview(blackview)
        view.bringSubviewToFront(Container)
        blackview.alpha = 0
    }
    
    func showContainer() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            
            self.Container.transform = .identity
            self.blackview.alpha = 1
        })
    }
    
    func hideContainer() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            
            self.Container.transform = CGAffineTransform(translationX: 0, y: self.Container.frame.height)
            self.blackview.alpha = 0
        })
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        hideContainer()
    }
    
    func getSearchArchive(searchKeyword: String) {
        
        SearchArchiveService.shared.getSearchArchive(keyword: searchKeyword) {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                //let _result = result as! [Recommend]
                //self.recommend = _result
                self.searchArchiveData = result as! [SearchArchive]
                self.searchResultNum.text = "\(self.searchArchiveData.count)"
                self.searchResult.reloadData()
                
                //print(result)
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr at getRecommend")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func getSearchArticle(searchKeyword: String) {
        
        SearchArticleService.shared.getSearchArticle(keyword: searchKeyword) {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                //let _result = result as! [Recommend]
                //self.recommend = _result
                self.searchArticleData = result as! [SearchArticle]
                self.searchResult.reloadData()
                
                //print(result)
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr at getRecommend")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    
    }
    
   





        

