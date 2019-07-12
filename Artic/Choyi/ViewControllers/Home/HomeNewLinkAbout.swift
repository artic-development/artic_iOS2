//
//  HomeNewLinkAbout.swift
//  Artic
//
//  Created by admin on 05/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import Kingfisher
import SafariServices

class HomeNewLinkAbout: UIViewController {
    var newArticleOne : NewArticleOne = NewArticleOne(article_idx: 0, article_title: "", thumnail: "https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/1RQb/image/q4eYwbcylf3Rjp3L0HGcAb5eCRQ.jpeg", link: "", domain: "", date: "", hits: 0, pick: 0, archive_idx: 0, archive_title: "", like: false)
    var articlesData: ArticleListData = ArticleListData(archive_idx: 1, user_idx: 1, archive_title: "d", date: "d", archive_img: "d", category_idx: 1, articles: [Articles(archive_idx: 1, article_title: "s", thumnail: "s", link: "s", domain: "s", date: "s", hits: 1, pick: 1, like: true, like_cnt: 2)])
    var articleIdx: Int = 0
    
    @IBOutlet var superView: UIView!
    @IBOutlet weak var archiveTitle: UITextView!
    @IBOutlet weak var articleBigImg: UIImageView!
    @IBOutlet weak var archiveTitleView: UIView!
    @IBOutlet weak var webLabel: UILabel!
    @IBOutlet weak var articleTitle: UITextView!
    
    //아카이브의 다른 아티클
    //1번째 셀
    @IBOutlet weak var backView1: UIView!
    @IBOutlet weak var otherArticleImg1: UIImageView!
    @IBOutlet weak var otherArticleTitle1: UITextView!
    @IBOutlet weak var otherWebLabel1: UILabel!
    
    //2번째 셀
    @IBOutlet weak var backView2: UIView!
    @IBOutlet weak var otherArticleImg2: UIImageView!
    @IBOutlet weak var otherArticleTitle2: UITextView!
    @IBOutlet weak var otherWebLabel2: UILabel!
    
    //3번째 셀
    @IBOutlet weak var backView3: UIView!
    @IBOutlet weak var otherArticleImg3: UIImageView!
    @IBOutlet weak var otherArticleTitle3: UITextView!
    @IBOutlet weak var otherWebLabel3: UILabel!
    
    //4번째 셀
    @IBOutlet weak var backView4: UIView!
    @IBOutlet weak var otherArticleImg4: UIImageView!
    @IBOutlet weak var otherArticleTitle4: UITextView!
    @IBOutlet weak var otherWebLabel4: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewArticleOne(articleIdx: articleIdx)
        
        
        //아카이브 제목에 따라 회색영역 늘어나기
        archiveTitle.text = "아카이브 이름"
        archiveTitle.sizeToFit()
        archiveTitleView.frame = CGRect(x: 0, y: 0, width:superView.frame.width, height: archiveTitle.frame.width)
        
        archiveTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        //아티클 제목에 따라 높이 늘어나기
        articleTitle.text = "아티클 이름"
        articleTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        articleTitle.sizeToFit()
        
        
        //다른 아티클 view 4개 경계, 둥글게
        backView1.makeRounded(cornerRadius: 6)
        backView2.makeRounded(cornerRadius: 6)
        backView3.makeRounded(cornerRadius: 6)
        
        backView4.makeRounded(cornerRadius: 6)
        
        backView1.setBorder(borderColor: UIColor.colorWithRGBHex(hex: 0xcdcdcd), borderWidth: 0.5)
        backView2.setBorder(borderColor: UIColor.colorWithRGBHex(hex: 0xcdcdcd), borderWidth: 0.5)
        backView3.setBorder(borderColor: UIColor.colorWithRGBHex(hex: 0xcdcdcd), borderWidth: 0.5)
        backView4.setBorder(borderColor: UIColor.colorWithRGBHex(hex: 0xcdcdcd), borderWidth: 0.5)
        
        //다른 아티클 textView 상하좌우간격
        otherArticleTitle1.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        otherArticleTitle1.sizeToFit()
        otherArticleTitle2.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        otherArticleTitle2.sizeToFit()
        otherArticleTitle3.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        otherArticleTitle3.sizeToFit()
        otherArticleTitle4.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        otherArticleTitle4.sizeToFit()
        
    }
    
    @IBAction func articleTitleTapped(_ sender: Any) {
        
        guard let url = URL(string: newArticleOne.link) else {
            return
        }
        let safariview = SFSafariViewController(url: url)
        present(safariview, animated: true, completion: nil)
        
        
    }
    
    @IBAction func otherArticleTapped1(_ sender: Any) {
        guard let url = URL(string: articlesData.articles![0].link!) else {
            return
        }
        let safariview = SFSafariViewController(url: url)
        present(safariview, animated: true, completion: nil)
    }
    
    @IBAction func otherArticleTapped2(_ sender: Any) {
        guard let url = URL(string: articlesData.articles![1].link!) else {
            return
        }
        let safariview = SFSafariViewController(url: url)
        present(safariview, animated: true, completion: nil)
    }
    
    @IBAction func otherArticleTapped3(_ sender: Any) {
        guard let url = URL(string: articlesData.articles![2].link!) else {
            return
        }
        let safariview = SFSafariViewController(url: url)
        present(safariview, animated: true, completion: nil)
    }
    
    @IBAction func otherArticleTapped4(_ sender: Any) {
        guard let url = URL(string: articlesData.articles![3].link!) else {
            return
        }
        let safariview = SFSafariViewController(url: url)
        present(safariview, animated: true, completion: nil)
    }
    
    @IBAction func viewAllBtnClicked(_ sender: Any) {
        //전체보기 버튼 클릭
        let storyboard: UIStoryboard = UIStoryboard(name: "homeSB", bundle: nil)
        guard let dvc = storyboard.instantiateViewController(withIdentifier: "HomeNewArchiveDetail") as? HomeNewArchiveDetail
            else {return}
        
        dvc.archiveIdx = newArticleOne.archive_idx
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    func getNewArticleOne(articleIdx: Int) {
        
        NewArticleOneService.shared.getNewArticleOne(articleIdx: articleIdx) {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! NewArticleOne
                self.newArticleOne = _result
                //                print("ㅏㅏ")
                print(result)
                
                self.archiveTitle.text = self.newArticleOne.archive_title
                self.archiveTitle.sizeToFit()
                self.archiveTitleView.frame = CGRect(x: 0, y: 0, width: self.superView.frame.width, height: self.archiveTitle.frame.width)
                
                self.archiveTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                
                //아티클 제목에 따라 높이 늘어나기
                self.articleTitle.text = self.newArticleOne.article_title
                self.articleTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                self.articleTitle.sizeToFit()
                
                self.webLabel.text = self.newArticleOne.domain
                
               
                guard let url = URL(string: self.newArticleOne.thumnail) else {
                    return
                }
                    
                self.articleBigImg.kf.setImage(with: url)
                
                print("zz")
                self.getArticles(archiveIdx2: self.newArticleOne.archive_idx)
                
                
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr at getNewArticleOne")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
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
                
                if self.articlesData.articles!.count >= 0 {
                    if self.articlesData.articles!.count >= 1 {
                        guard let url1 = URL(string: self.articlesData.articles![0].thumnail!) else {
                            return
                        }
                        self.otherArticleImg1.kf.setImage(with: url1)
                        self.otherArticleTitle1.text = self.articlesData.articles![0].article_title!
                        self.otherWebLabel1.text = self.articlesData.articles![0].domain!
                        
                        if self.articlesData.articles!.count >= 2 {
                            guard let url2 = URL(string: self.articlesData.articles![1].thumnail!) else {
                                return
                            }
                            self.otherArticleImg2.kf.setImage(with: url2)
                            self.otherArticleTitle2.text = self.articlesData.articles![1].article_title!
                            self.otherWebLabel2.text = self.articlesData.articles![1].domain!
                            
                            if self.articlesData.articles!.count >= 3 {
                                guard let url3 = URL(string: self.articlesData.articles![2].thumnail!) else {
                                    return
                                }
                                self.otherArticleImg3.kf.setImage(with: url3)
                                self.otherArticleTitle3.text = self.articlesData.articles![2].article_title!
                                self.otherWebLabel3.text = self.articlesData.articles![2].domain!
                                
                                if self.articlesData.articles!.count >= 4 {
                                    guard let url4 = URL(string: self.articlesData.articles![3].thumnail!) else {
                                        return
                                    }
                                    self.otherArticleImg4.kf.setImage(with: url4)
                                    self.otherArticleTitle4.text = self.articlesData.articles![3].article_title!
                                    self.otherWebLabel4.text = self.articlesData.articles![3].domain!
                                }
                            }
                        }
                    }
                }
                
                
                
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

