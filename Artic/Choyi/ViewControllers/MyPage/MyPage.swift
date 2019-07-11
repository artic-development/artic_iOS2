//
//  MyPage.swift
//  Artic
//
//  Created by admin on 04/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import Kingfisher

class MyPage: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var myEmailLabel: UILabel!
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet var myInfoView: UIView!
    @IBOutlet weak var myProfilePicView: UIView!
    @IBOutlet weak var myProfilePicImg: UIImageView!
    @IBOutlet weak var myPageTableView: UITableView!
    var isScrapBtnClicked = true
    @IBOutlet weak var scrapBtn: UIButton!
    @IBOutlet weak var myBtn: UIButton!
    
    var MypageList: MyPageData = MyPageData(userId: "id", userImg: "img", userIntro: "intro", userName: "name")

    var ScrappedArchiveList: [ScrappedArchive] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myPageTableView.separatorStyle = .none
        
//        scrapBtn.adjustsImageWhenHighlighted = false
//        myBtn.adjustsImageWhenHighlighted = false
        let profileImgurl = URL(string: MypageList.userImg!)
       
        myProfilePicView.makeRounded(cornerRadius: 36)
        //self.view.addSubview(myTextView)
        myTextView.text = "\(MypageList.userIntro!)"
        myNameLabel.text = "\(MypageList.userName!)"
        myEmailLabel.text = "\(MypageList.userId!)"
        myProfilePicImg.kf.setImage(with: profileImgurl)
        //let url1 = URL(string: homeCateArchiveList[0].archive_img)
       // cell.backImg1.kf.setImage(with: url1)
//        myTextView.translatesAutoresizingMaskIntoConstraints = true
//        myTextView.sizeToFit()
        myTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        myTextView.sizeToFit()
//        myTextView.isScrollEnabled = false
        
        myPageTableView.delegate = self
        myPageTableView.dataSource = self
        
        let nibName = UINib(nibName: "ScrapXibCell", bundle: nil)
        myPageTableView.register(nibName, forCellReuseIdentifier: "ScrapXibCell")
        
        let nibName2 = UINib(nibName: "MyXibCell", bundle: nil)
        myPageTableView.register(nibName2, forCellReuseIdentifier: "MyXibCell")
        
    
       getMyPage()
    getArchiveScrap()
    
    }
    
    func getMyPage() {
        
        MyPageService.shared.getMyPage() {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! MyPageData
                self.MypageList = _result
               // self.myInfoView.reloadData()
                
                 let profileImgurl = URL(string: self.MypageList.userImg!)
                self.myTextView.text = "\(self.MypageList.userIntro!)"
                self.myNameLabel.text = "\(self.MypageList.userName!)"
                self.myEmailLabel.text = "\(self.MypageList.userId!)"
               self.myProfilePicImg.kf.setImage(with: profileImgurl)
                
                print(result)
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr ddd")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func getArchiveScrap() {
        print("FUCK YOU")
        ArchviescrapService.shared.getArchiveScrap(){
        
            [weak self]
        (data) in
        
        guard let `self` = self else { return }
        
        switch data {
            
        case .success(let result):
            let _result = result as! [ScrappedArchive]
            self.ScrappedArchiveList = _result
            // self.myInfoView.reloadData()
            self.myPageTableView.reloadData()

            print(result)
            
        case .requestErr(let message):
            print(message)
        case .pathErr:
            print("pathErr ddd")
        case .serverErr:
            print("serverErr")
        case .networkFail:
            print("networkFail")
            }
        }
    }
    
    
    @IBAction func scrapBtnClicked(_ sender: UIButton) {
                
                isScrapBtnClicked = true
                
                myBtn.setTitleColor(UIColor.colorWithRGBHex(hex: 0x000000, alpha: 1), for: .normal)
                myBtn.setBackgroundImage(UIImage(named: "blankMyarchive"), for: .normal)
                scrapBtn.setTitleColor(UIColor.colorWithRGBHex(hex: 0x4f80ff, alpha: 1), for: .normal)
                scrapBtn.setBackgroundImage(UIImage(named: "dotScrap"), for: .normal)
        
        
        myPageTableView.reloadData()
        
        
        
    }
    
    @IBAction func myBtnClicked(_ sender: UIButton) {
        
        
        
//        scrapBtn.setBackgroundImage(UIImage(named: "blankScrap"), for: .normal)
//        scrapBtn.setBackgroundImage(UIImage(named: "dotScrap"), for: .selected)
//
//        scrapBtn.setTitleColor(UIColor.colorWithRGBHex(hex: 0x000000, alpha: 1), for: .normal)
//        scrapBtn.setTitleColor(UIColor.colorWithRGBHex(hex: 0x4f80ff, alpha: 1), for: .selected)
//        myBtn.setBackgroundImage(UIImage(named: "blankMy"), for: .normal)
//        myBtn.setBackgroundImage(UIImage(named: "dotMy"), for: .selected)
//        myBtn.setTitleColor(UIColor.colorWithRGBHex(hex: 0x000000, alpha: 1), for: .normal)
//        myBtn.setTitleColor(UIColor.colorWithRGBHex(hex: 0x4f80ff, alpha: 1), for: .selected)
                isScrapBtnClicked = false
                
                scrapBtn.setTitleColor(UIColor.colorWithRGBHex(hex: 0x000000, alpha: 1), for: .normal)
                scrapBtn.setBackgroundImage(UIImage(named: "blackScrap"), for: .normal)
                myBtn.setTitleColor(UIColor.colorWithRGBHex(hex: 0x4f80ff, alpha: 1), for: .normal)
                myBtn.setBackgroundImage(UIImage(named: "dotMyarchive"), for: .normal)
        
        myPageTableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(ScrappedArchiveList.count)개")
        if ScrappedArchiveList.count % 2 == 0{
            if ScrappedArchiveList.count == 0{
                tableView.setEmptyView(mesaageimageview: UIImage(named: "mypageCharacter")!, message: "스크랩한 아카이브가 없어요")

                
                return ScrappedArchiveList.count
            }
            
            
            return ScrappedArchiveList.count/2
        }
        else if ScrappedArchiveList.count % 2 == 1{
            return (ScrappedArchiveList.count+1)/2
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        if isScrapBtnClicked == true {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScrapXibCell", for: indexPath) as! ScrapXibCell
            if ScrappedArchiveList.count % 2 == 0{
           
            cell.leftArchiveTitle.text = "\(ScrappedArchiveList[indexPath.row*2].archive_title)"
            cell.rightArchiveTitle.text = "\(ScrappedArchiveList[indexPath.row*2+1].archive_title)"
            }
            else {
                if  (ScrappedArchiveList.count / 2 ) + 1  == (indexPath.row)  {
                    print("홀수")
                    cell.rightCellView.isHidden = true
                
            }
            }
            
        //arr[indexPath.row]
        //cell.myImageView.image = UIImage(named: "zedd")
            
            cell.leftArchiveTitle.sizeToFit()
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyXibCell", for: indexPath) as! MyXibCell
            return cell
            
        }
    }
    
}
extension UITableView {
    func setEmptyView(mesaageimageview: UIImage, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: 358))
        
        let imageview = UIImageView()
        let messageLabel = UILabel()
        
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageview.translatesAutoresizingMaskIntoConstraints = false
       
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "NanumBarunGothic", size: 14)
        imageview.image = UIImage(named: "mypageCharacter")
        emptyView.addSubview(imageview)
        emptyView.addSubview(messageLabel)
        
       
        imageview.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: 60).isActive = true
        imageview.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        
        imageview.image = mesaageimageview
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        // The only tricky part is here:
        UIView.animate(withDuration: 1, animations: {
            
            imageview.transform = CGAffineTransform(rotationAngle: .pi / 10)
        }, completion: { (finish) in
            UIView.animate(withDuration: 1, animations: {
                imageview.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
            }, completion: { (finishh) in
                UIView.animate(withDuration: 1, animations: {
                    imageview.transform = CGAffineTransform.identity
                })
            })
            
        })
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
    
}

