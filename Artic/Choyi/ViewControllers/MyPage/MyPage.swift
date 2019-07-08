//
//  MyPage.swift
//  Artic
//
//  Created by admin on 04/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

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
    @IBOutlet weak var plusBtn: UIButton!
    var MypageList: MyPageData!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusBtn.isHidden = true
        myPageTableView.separatorStyle = .none
        
//        scrapBtn.adjustsImageWhenHighlighted = false
//        myBtn.adjustsImageWhenHighlighted = false
        
        myProfilePicView.makeRounded(cornerRadius: 36)
        //self.view.addSubview(myTextView)
        myTextView.text = "\(MypageList.user_intro)"
        
        
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
                print(result)
                
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
    
    
    @IBAction func scrapBtnClicked(_ sender: UIButton) {
                
                isScrapBtnClicked = true
                
                myBtn.setTitleColor(UIColor.colorWithRGBHex(hex: 0x000000, alpha: 1), for: .normal)
                myBtn.setBackgroundImage(UIImage(named: "blankMyarchive"), for: .normal)
                scrapBtn.setTitleColor(UIColor.colorWithRGBHex(hex: 0x4f80ff, alpha: 1), for: .normal)
                scrapBtn.setBackgroundImage(UIImage(named: "dotScrap"), for: .normal)
        
        
        myPageTableView.reloadData()
        plusBtn.isHidden = true
        
        
    }
    
    @IBAction func myBtnClicked(_ sender: UIButton) {
        
        plusBtn.isHidden = false
        
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
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isScrapBtnClicked == true {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScrapXibCell", for: indexPath) as! ScrapXibCell
            
        cell.leftArchiveTitle.text = "asdasd"
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
