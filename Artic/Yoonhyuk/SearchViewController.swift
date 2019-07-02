//
//  SearchViewController.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 02/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import TagListView

class SearchViewController: UIViewController, TagListViewDelegate {

    
    @IBOutlet weak var SearchTF: UITextField!
    
    @IBOutlet weak var Taglist: TagListView!
    @IBOutlet weak var Taglist_2: TagListView!
    @IBOutlet weak var Taglist_3: TagListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SearchTF.layer.cornerRadius = 25
        SearchTF.keyboardType = .default
        SearchTF.setLeftPaddingPoints(50)
        
        
        
        Taglist.addTags(["UX/UI 디자인","BX 디자인","브랜딩"])
        Taglist.textFont = UIFont.systemFont(ofSize: 14)
        Taglist.borderWidth = 1
        
        
        
        Taglist_2.addTags(["서비스 디자인","편집디자인","브랜딩"])
        Taglist_2.textFont = UIFont.systemFont(ofSize: 14)
        
        
        
        Taglist_3.addTags(["안드","아요","할로"])
        Taglist_3.textFont = UIFont.systemFont(ofSize: 14)
        
     
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }//화면터치하여 키보드 내리기
    
}
