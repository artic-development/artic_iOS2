//
//  HomeNewArchiveDetail.swift
//  Artic
//
//  Created by admin on 05/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class HomeNewArchiveDetail: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var archiveDetailTableVIew: UITableView!
    @IBOutlet weak var archiveTitle: UITextView!
    @IBOutlet weak var storeBtn: UIButton!
    var isStored = false
    var archive_idx = 0
    
    //위 레이어 뷰
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        archiveDetailTableVIew.delegate = self
        archiveDetailTableVIew.dataSource = self
        archiveDetailTableVIew.separatorStyle = .none
        
        
        
        let nibName = UINib(nibName: "ArticleCell", bundle: nil)
        archiveDetailTableVIew.register(nibName, forCellReuseIdentifier: "ArticleCell")
        
        archiveTitle.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        archiveTitle.sizeToFit()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        return cell
        
    }
    
    
    
    @IBAction func storeBtnClicked(_ sender: Any) {
        
        
        isStored = !isStored
        
        if isStored == true {
            
            guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "blackViewController") as? blackViewController else{
                return
            }
            self.present(rvc, animated: true)
            
            storeBtn.setImage(UIImage(named: "btnScrapFilledBig"), for: .normal)
        }else{
            print("ss")
            storeBtn.setImage(UIImage(named: "btnScrapBig"), for: .normal)
        }
        
    }
    
}
