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
    @IBOutlet weak var addView: UIStackView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var isStored = false
    var archive_idx = 0
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        cell.likeFolder.tag = indexPath.row
        cell.likeFolder.addTarget(self, action: #selector(self.bookbtn1(_:)), for: .touchUpInside);
        //cell.likeFolder.addTarget(self, action: selector(self.bookbtn1(_:)), for:.touchUpInside);
        return cell
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
    
}
