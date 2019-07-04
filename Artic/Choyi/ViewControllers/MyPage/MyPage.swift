//
//  MyPage.swift
//  Artic
//
//  Created by admin on 04/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class MyPage: UIViewController {

    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var myEmailLabel: UILabel!
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet var myInfoView: UIView!
    @IBOutlet weak var myProfilePicView: UIView!
    @IBOutlet weak var myProfilePicImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myProfilePicView.makeRounded(cornerRadius: 36)
        //self.view.addSubview(myTextView)
        myTextView.text = "안녕하세요아틱입니다저는아틱입니다~ㅍ딪ㅣㅑ료ㅣ오ㅕ리ㅑㅕ리ㅕ리ㅑ리ㅑ리ㅑㅕ리ㅑㅕ리ㅑㅕ리ㅑㅕ리ㅑㅕ리ㅑㅕ리ㅕ랴ㅣㅕ리ㅕ랴ㅕ리ㅑㅕ리ㅑㅕ리ㅕㅑ리"
        
//        myTextView.translatesAutoresizingMaskIntoConstraints = true
//        myTextView.sizeToFit()
        myTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        myTextView.isScrollEnabled = false
        
        
        
        
    }

}
