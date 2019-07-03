//
//  HomeNewLink.swift
//  Artic
//
//  Created by admin on 04/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class HomeNewLink: UIViewController {
    @IBOutlet var superView: UIView!
    @IBOutlet weak var archiveTitle: UITextView!
    @IBOutlet weak var archiveTitleView: UIView!
    @IBOutlet weak var webLabel: UILabel!
    @IBOutlet weak var articleTitle: UITextView!
    @IBOutlet weak var buttonView: UIView!
    
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
        
        
        //아카이브 제목에 따라 회색영역 늘어나기
        archiveTitle.text = "아카이브제목입니다아카이브제목입니다아카이브제목입니다아카이브제목입니다아카이브제목입니다"
        archiveTitle.sizeToFit()
        archiveTitleView.frame = CGRect(x: 0, y: 0, width:superView.frame.width, height: archiveTitle.frame.width)
        
        archiveTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        //아티클 제목에 따라 높이 늘어나기
        articleTitle.text = "아티클제목입니다아티클"
        articleTitle.sizeToFit()
        articleTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
       //아티클 읽기 버튼 경계, 둥글게
        buttonView.makeRounded(cornerRadius: 6)
        buttonView.setBorder(borderColor: UIColor.colorWithRGBHex(hex: 0x4f80ff), borderWidth: 1)
        
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
        otherArticleTitle2.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        otherArticleTitle3.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        otherArticleTitle4.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }

    @IBAction func readArticleBtnClicked(_ sender: Any) {
        //아티클 읽기 버튼 클릭시
        
    }
    
    
}
