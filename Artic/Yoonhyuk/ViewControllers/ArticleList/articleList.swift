//
//  articleList.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 04/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class articleList: UIViewController, UITableViewDelegate, UITableViewDataSource {
@IBOutlet weak var articleTable: UITableView!
    
    var archiveIdx = 9999
    var articlesData: ArticleListData = ArticleListData(archive_idx: 1, user_idx: 1, archive_title: "d", date: "d", archive_img: "d", category_idx: 1, articles: [Articles(archive_idx: 1, article_title: "s", thumnail: "s", link: "s", domain: "s", date: "s", hits: 1, pick: 1, like: true, like_cnt: 2)])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleTable.delegate = self
        articleTable.dataSource = self
        
        let nibName = UINib(nibName: "ArticleCell", bundle: nil)
        
        articleTable.register(nibName, forCellReuseIdentifier: "ArticleCell")
        
        getArticles(archiveIdx2: archiveIdx)
        
        // Do any additional setup after loading the view.
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        //return 10
        return articlesData.articles!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = articleTable.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell

        
        let article = articlesData.articles![indexPath.row]
        cell.articleTitle.text = article.article_title!

        let url = URL(string: article.thumnail ?? "https://hyeongbucket.s3.ap-northeast-2.amazonaws.com/1562401485536.png")
        cell.articleImg.kf.setImage(with: url)

        let domain = article.domain ?? ""

        cell.webLabel.text = domain
        cell.likeNum.text = "\(article.like_cnt)"
       
        return cell
        
        
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
                self.articleTable.reloadData()
                
                print(result)
                
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
