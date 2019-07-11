//
//  HomeNewArchiveDetail.swift
//  Artic
//
//  Created by admin on 05/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import SafariServices

class HomeNewArchiveDetail: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var archiveDetailTableVIew: UITableView!
    @IBOutlet weak var archiveTitle: UITextView!
    @IBOutlet weak var storeBtn: UIButton!
    @IBOutlet weak var addView: UIStackView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var archiveIdx = 999
    var articlesData: ArticleListData = ArticleListData(archive_idx: 1, user_idx: 1, archive_title: "d", date: "d", archive_img: "d", category_idx: 1, articles: [Articles(archive_idx: 1, article_title: "s", thumnail: "s", link: "s", domain: "s", date: "s", hits: 1, pick: 1, like: true, like_cnt: 2)])
    var isStored = false

    var blackview: UIView!
    
    //위 레이어 뷰
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        archiveDetailTableVIew.delegate = self
        archiveDetailTableVIew.dataSource = self
        archiveDetailTableVIew.separatorStyle = .none
        
        setBlackView()
        addView.transform = CGAffineTransform(translationX: 0, y: addView.frame.height)
        
        let nibName = UINib(nibName: "ArticleCell", bundle: nil)
        archiveDetailTableVIew.register(nibName, forCellReuseIdentifier: "ArticleCell")
        
        archiveTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        archiveTitle.sizeToFit()
        
        getArticles(archiveIdx2: archiveIdx)
        
    }
    func setBlackView() {
        
        blackview = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        blackview.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        
        
        view.addSubview(blackview)
        view.bringSubviewToFront(addView)
        blackview.alpha = 0
    }
    func showContainer() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            
            self.addView.transform = .identity
            self.blackview.alpha = 1
        })
    }
    
    func hideContainer() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            
            self.addView.transform = CGAffineTransform(translationX: 0, y: self.addView.frame.height)
            self.blackview.alpha = 0
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesData.articles!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = archiveDetailTableVIew.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        
        let article = articlesData.articles![indexPath.row]
        cell.articleTitle.text = article.article_title!
        
        let url = URL(string: article.thumnail ?? "https://hyeongbucket.s3.ap-northeast-2.amazonaws.com/1562401485536.png")
        cell.articleImg.kf.setImage(with: url)
        
        let domain = article.domain ?? ""
        
        cell.webLabel.text = domain
        cell.likeNum.text = "\(article.like_cnt)"
        
        cell.likeFolder.tag = indexPath.row
        cell.likeFolder.addTarget(self, action: #selector(self.bookbtn1(_:)), for: .touchUpInside);
        //cell.likeFolder.addTarget(self, action: selector(self.bookbtn1(_:)), for:.touchUpInside);
        return cell
    }
    
    func tableView(_ tableview: UITableView,didSelectRowAt indexPath: IndexPath) {
        
       
        guard let url = URL(string: articlesData.articles![indexPath.row].link!) else {
            return
        }
        let safariview = SFSafariViewController(url: url)
        present(safariview, animated: true, completion: nil)
        
        
        
    }
    
    
    @objc func bookbtn1(_ sender : UIButton){
        // call your segue code here
        showContainer()
    }
    
    
    @IBAction func storeBtnClicked(_ sender: Any) {
        
        
        isStored = !isStored
        
        if isStored == true {
            
            
            
            storeBtn.setImage(UIImage(named: "btnScrapFilledBig"), for: .normal)
        }else{
            print("ss")
            storeBtn.setImage(UIImage(named: "btnScrapBig"), for: .normal)
        }
        
    }
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        hideContainer()
    }
    
    func getArticles(archiveIdx2: Int) {
        
        ArticleService.shared.getArticle(archiveIdx: archiveIdx2) {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! ArticleListData
                self.articlesData = _result
                
                self.archiveTitle.text = _result.archive_title!
                self.archiveDetailTableVIew.reloadData()
                
                //print(result)
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr at getArticles")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
}

