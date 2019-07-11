//
//  Home.swift
//  Artic
//
//  Created by admin on 03/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import SafariServices


class Home: UIViewController,UITableViewDelegate, UITableViewDataSource, newArchiveProtocol, newArticleProtocol {
    
    func pushToNewArchiveArticle(withData:Int) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "homeSB", bundle: nil)
        guard let dvc = storyboard.instantiateViewController(withIdentifier: "HomeNewArchiveDetail") as? HomeNewArchiveDetail
            else {return}
        
        dvc.archiveIdx = withData
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    func pushToNewArticleLink(withLink: String) {
        
        guard let url = URL(string: withLink) else {
            return
        }
        let safariview = SFSafariViewController(url: url)
        self.present(safariview, animated: true, completion: nil)
    }
    
    @IBOutlet weak var homeTableView: UITableView!
    var categoriesAll = ["새로운 아카이브", "새로운 아티클", "최근 읽은 아티클"]
    var homeCateArchiveList: [HomeCateArchive] = [
        HomeCateArchive(category_title: "카테고리명", archive_idx: 0, user_idx: 0, archive_title: "아카이브명", date: "2019-07-09T22:55:20.000Z", archive_img: "https://hyeongbucket.s3.ap-northeast-2.amazonaws.com/artic/archivedefault.png", category_idx: 99, article_cnt: 0),
        HomeCateArchive(category_title: "카테고리명", archive_idx: 0, user_idx: 0, archive_title: "아카이브명", date: "2019-07-09T22:55:20.000Z", archive_img: "https://hyeongbucket.s3.ap-northeast-2.amazonaws.com/artic/archivedefault.png", category_idx: 99, article_cnt: 0),
        HomeCateArchive(category_title: "카테고리명", archive_idx: 0, user_idx: 0, archive_title: "아카이브명", date: "2019-07-09T22:55:20.000Z", archive_img: "https://hyeongbucket.s3.ap-northeast-2.amazonaws.com/artic/archivedefault.png", category_idx: 99, article_cnt: 0),
        HomeCateArchive(category_title: "카테고리명", archive_idx: 0, user_idx: 0, archive_title: "아카이브명", date: "2019-07-09T22:55:20.000Z", archive_img: "https://hyeongbucket.s3.ap-northeast-2.amazonaws.com/artic/archivedefault.png", category_idx: 99, article_cnt: 0)]
    var categoriesHome: [Category] = []
    var recentArticle: [RecentArticle] = []
    var archiveIdx = 999
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.separatorStyle = .none
        homeTableView.sectionIndexBackgroundColor = UIColor.white
        getCategory()
        getRecentArticle()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //네비게이션 바 숨김
        self.navigationController?.navigationBar.isHidden = true

    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func cellTapped(){
        //code for navigation
                let storyboard: UIStoryboard = UIStoryboard(name: "homeSB", bundle: nil)
                guard let dvc = storyboard.instantiateViewController(withIdentifier: "HomeNewArchiveDetail") as? HomeNewArchiveDetail
                    else {return}
        
                dvc.archiveIdx = archiveIdx
        
                self.present(dvc, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoriesHome.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        print(section)
//        print("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ")
//        getHomeCateArchive(cateIdx2: section)
//        return homeCateArchiveList[0].archive_title
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2{
            return 5
        }else{
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            //새로운 아카이브
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewArchiveCell") as! NewArchiveCell
            //cell 선택시 배경 색 지정
            var bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = bgColorView
            
            cell.delegate = self
            
            return cell
        }else if indexPath.section == 1{
            //새로운 아티클
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewArticleCell") as! NewArticleCell
            cell.delegate2 = self
            //cell 선택시 배경 색 지정
            var bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = bgColorView
            
            return cell
        }else if indexPath.section == 2{
            //최근 읽은 아티클
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentArticleCell") as! RecentArticleCell
            //print(indexPath.row)
            
            if(recentArticle.count == 0){
                return cell
            }else{
                let RecentArticle = recentArticle[indexPath.row]
                
                //썸네일
                let recentImgUrl = URL(string: RecentArticle.thumnail)
                cell.smallArchiveImg.kf.setImage(with: recentImgUrl)
                
                //제목
                cell.articleTitle.text = RecentArticle.article_title
                //웹라벨
                cell.webLabel.text = RecentArticle.domain
            }
        
            
            
            //cell 선택시 배경 색 지정
            var bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = bgColorView
            
            return cell
        }else{
            //카테고리별
            let cell = tableView.dequeueReusableCell(withIdentifier: "CateArchiveCell") as! CateArchiveCell
            //cell 선택시 배경 색 지정
            var bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = bgColorView

            getHomeCateArchive(cateIdx2: indexPath.section + 2)
            
            if homeCateArchiveList.count == 4 {
                cell.archiveTitle1.text = "\(homeCateArchiveList[0].archive_title ?? "")"
                cell.archiveTitle2.text = "\(homeCateArchiveList[1].archive_title ?? "")"
                cell.archiveTitle3.text = "\(homeCateArchiveList[2].archive_title ?? "")"
                cell.archiveTitle4.text = "\(homeCateArchiveList[3].archive_title ?? "")"
                
                let url1 = URL(string: homeCateArchiveList[0].archive_img ?? "")
                cell.backImg1.kf.setImage(with: url1)
                let url2 = URL(string: homeCateArchiveList[1].archive_img ?? "")
                cell.backImg2.kf.setImage(with: url2)
                let url3 = URL(string: homeCateArchiveList[2].archive_img ?? "")
                cell.backImg3.kf.setImage(with: url3)
                let url4 = URL(string: homeCateArchiveList[3].archive_img ?? "")
                cell.backImg4.kf.setImage(with: url4)
                
                //매개변수 바꿔야됨
                cell.numLabel1.text = "아티클 \(homeCateArchiveList[0].article_cnt ?? 0)개"
                cell.numLabel2.text = "아티클 \(homeCateArchiveList[1].article_cnt ?? 0)개"
                cell.numLabel3.text = "아티클 \(homeCateArchiveList[2].article_cnt ?? 0)개"
                cell.numLabel4.text = "아티클 \(homeCateArchiveList[3].article_cnt ?? 0)개"
            }else if homeCateArchiveList.count == 3 {
                cell.archiveTitle1.text = "\(homeCateArchiveList[0].archive_title ?? "")"
                cell.archiveTitle2.text = "\(homeCateArchiveList[1].archive_title ?? "")"
                cell.archiveTitle3.text = "\(homeCateArchiveList[2].archive_title ?? "")"
                cell.archiveTitle4.text = ""
                
                let url1 = URL(string: homeCateArchiveList[0].archive_img ?? "")
                cell.backImg1.kf.setImage(with: url1)
                let url2 = URL(string: homeCateArchiveList[1].archive_img ?? "")
                cell.backImg2.kf.setImage(with: url2)
                let url3 = URL(string: homeCateArchiveList[2].archive_img ?? "")
                cell.backImg3.kf.setImage(with: url3)

                
                //매개변수 바꿔야됨
                cell.numLabel1.text = "아티클 \(homeCateArchiveList[0].article_cnt ?? 0)개"
                cell.numLabel2.text = "아티클 \(homeCateArchiveList[1].article_cnt ?? 0)개"
                cell.numLabel3.text = "아티클 \(homeCateArchiveList[2].article_cnt ?? 0)개"
                cell.numLabel4.text = "아티클 0개"
            }else if homeCateArchiveList.count == 2 {
                cell.archiveTitle1.text = "\(homeCateArchiveList[0].archive_title ?? "")"
                cell.archiveTitle2.text = "\(homeCateArchiveList[1].archive_title ?? "")"
                cell.archiveTitle3.text = ""
                cell.archiveTitle4.text = ""
                
                let url1 = URL(string: homeCateArchiveList[0].archive_img ?? "")
                cell.backImg1.kf.setImage(with: url1)
                let url2 = URL(string: homeCateArchiveList[1].archive_img ?? "")
                cell.backImg2.kf.setImage(with: url2)
                
                //매개변수 바꿔야됨
                cell.numLabel1.text = "아티클 \(homeCateArchiveList[0].article_cnt ?? 0)개"
                cell.numLabel2.text = "아티클 \(homeCateArchiveList[1].article_cnt ?? 0)개"
                cell.numLabel3.text = "아티클 0개"
                cell.numLabel4.text = "아티클 0개"
            }else if homeCateArchiveList.count == 1 {
                cell.archiveTitle1.text = "\(homeCateArchiveList[0].archive_title ?? "")"
                cell.archiveTitle2.text = ""
                cell.archiveTitle3.text = ""
                cell.archiveTitle4.text = ""
                
                let url1 = URL(string: homeCateArchiveList[0].archive_img ?? "")
                cell.backImg1.kf.setImage(with: url1)
                //매개변수 바꿔야됨
                cell.numLabel1.text = "아티클 \(homeCateArchiveList[0].article_cnt ?? 0)개"
                cell.numLabel2.text = "아티클 0개"
                cell.numLabel3.text = "아티클 0개"
                cell.numLabel4.text = "아티클 0개"
            }else{
                
            }

            

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            //새로운 아카이브
            return 287
        }else if indexPath.section == 1{
            return 343
        }else if indexPath.section == 2{
            return 90
        }else{
            return 530
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white

        let titleLabel = UILabel()
        
        titleLabel.text = "\(categoriesAll[section])"
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: 20, y: 17, width:titleLabel.frame.width + 9, height: 18)
        titleLabel.font = UIFont(name: "NanumBarunGothicBold", size: 18)
        
        let button = UIButton(type: .system)
        //button.setTitle("See All", for: .normal)
        button.setImage(UIImage(named: "btnRightarrow"), for: .normal)
        button.tintColor = UIColor.black
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        var xPosition = 20 + titleLabel.frame.width
        button.frame = CGRect(x: xPosition, y: 14, width: 21, height: 21)
//        button.addTarget(self, action: #selector(showDetail), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(button)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            //새로운 아카이브
            //cellTapped()
            
        }else if indexPath.section == 1{
            //새로운 아티클
            
        }else if indexPath.section == 2{
            //최근 읽은 아티클
            
//            let storyboard = UIStoryboard(name: "homeSB", bundle: nil)
//            guard let dvc = storyboard.instantiateViewController(withIdentifier: "HomeNewLinkAbout") as? HomeNewLinkAbout
//                else {return}
            
//            self.navigationController?.pushViewController(dvc, animated: true)
            
        }else{
            //카테고리별
        }
    }

    @IBAction func homeSearchBtnClicked(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "searchSB", bundle: nil)
        guard let dvc = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
            else {return}
        
        self.navigationController?.pushViewController(dvc, animated: true)
        
//        self.present(dvc, animated: true, completion: nil)
    }
    
    
    func getHomeCateArchive(cateIdx2: Int) {
        
        HomeCateArchiveService.shared.getHomeCateArchive(cateIdx: cateIdx2) {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! [HomeCateArchive]
                self.homeCateArchiveList = _result
//                self.homeTableView.reloadData()
                
                //print(result)
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr at getHomeCateArchive")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func getCategory() {
        
        CategoryService.shared.getCategory() {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! [Category]
                self.categoriesHome = _result
               
                for num in 1 ... self.categoriesHome.count {
                    self.categoriesAll.append("\(self.categoriesHome[num-1].category_title)")
                }

                self.homeTableView.reloadData()
                //print(result)
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr at getCategory")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func getRecentArticle() {
        
        RecentArticleService.shared.getRecentArticle() {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! [RecentArticle]
                self.recentArticle = _result
                
                self.homeTableView.reloadData()
//                print("ㅏㅏ")
//                print(result)
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr at getRecentArticle")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
