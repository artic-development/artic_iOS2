//
//  NotificationTableVC.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class NotificationTableVC:UIViewController,UITableViewDelegate, UITableViewDataSource{
    
   
    @IBOutlet weak var notiTable: UITableView!
    let arr = ["a","b","c"]
    var isImageCell = true
    var notification : [Notification] = []
    
    
    //섹션별 row의 개수
    var newNotiNum = 0
    var readNotiNum = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         notiTable.delegate = self
         notiTable.dataSource = self
        
        notiTable.estimatedRowHeight = 150.0
        notiTable.rowHeight = UITableView.automaticDimension
        
        getNoti()
      

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    
 
        
        if let index = notiTable.indexPathForSelectedRow {
            notiTable.deselectRow(at: index, animated: true)
        }
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if section == 0 {
            return newNotiNum
        }else if section == 1{
            return readNotiNum
        }else{
            return 0
        }
    }
    
    

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        
        if indexPath.section == 0{
            
            if UInt(notification[indexPath.row].notification_type) == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
                
                cell.NotiTitle.text = "'\(notification[indexPath.row].articles[0].archive_title)'에 새로운 아티클이 추가되었습니다"
                
                cell.selectedBackgroundView = bgColorView
                return cell
            }else if (UInt(notification[indexPath.row].notification_type) == 1){
                let cell = tableView.dequeueReusableCell(withIdentifier: "recoNotification", for: indexPath) as! recoNotificationCell
                
                cell.RecoNotiTitle.text = "회원님이 좋아하실만한 아티클을 추천해드려요!"
                
                let url1 = URL(string: notification[indexPath.row].articles[0].thumnail)
                cell.img1.kf.setImage(with: url1)
                let url2 = URL(string: notification[indexPath.row].articles[1].thumnail)
                cell.img2.kf.setImage(with: url2)
                let url3 = URL(string: notification[indexPath.row].articles[2].thumnail)
                cell.img3.kf.setImage(with: url3)
                
                cell.selectedBackgroundView = bgColorView
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "readNotification", for: indexPath) as! readNotificationCell
                
                cell.ReadNotiTitle.text = "회원님이 스크랩 하신 '\(notification[indexPath.row].articles[0].archive_title)'에 \(notification[indexPath.row].articles.count)개 아티클을 읽지 않으셨습니다"
                
                cell.selectedBackgroundView = bgColorView
                return cell
            }
            
            //cell.textLabel?.text = arr[indexPath.row]
           
        }
        else {
            
            if UInt(notification[indexPath.row].notification_type) == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath)
                
                cell.selectedBackgroundView = bgColorView
                return cell
            }else if (UInt(notification[indexPath.row].notification_type) == 1){
                let cell = tableView.dequeueReusableCell(withIdentifier: "recoNotification", for: indexPath)
                
                cell.selectedBackgroundView = bgColorView
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "readNotification", for: indexPath)
                
                cell.selectedBackgroundView = bgColorView
                return cell
            }
            
            
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            if UInt(notification[indexPath.row].notification_type) == 0 {
                //새로운 아티클이 추가되었습니다
                let storyboard: UIStoryboard = UIStoryboard(name: "homeSB", bundle: nil)
                guard let dvc = storyboard.instantiateViewController(withIdentifier: "HomeNewArchiveDetail") as? HomeNewArchiveDetail
                    else {return}
                
                dvc.archiveIdx = notification[indexPath.row].articles[0].archive_idx
                
                self.navigationController?.pushViewController(dvc, animated: true)
                
            }else if (UInt(notification[indexPath.row].notification_type) == 1){
                //아티클을 추천해드려요! with images
                    let storyboard: UIStoryboard = UIStoryboard(name: "homeSB", bundle: nil)
                    guard let dvc = storyboard.instantiateViewController(withIdentifier: "HomeNewArchiveDetail") as? HomeNewArchiveDetail
                        else {return}
                    
                    dvc.archiveIdx = notification[indexPath.row].articles[0].archive_idx
                    
                    self.navigationController?.pushViewController(dvc, animated: true)
                
                
            }else{
                //n개 아티클을 읽지 않으셔씁니다
                        let storyboard: UIStoryboard = UIStoryboard(name: "homeSB", bundle: nil)
                        guard let dvc = storyboard.instantiateViewController(withIdentifier: "HomeNewArchiveDetail") as? HomeNewArchiveDetail
                            else {return}
                        
                        dvc.archiveIdx = notification[indexPath.row].articles[0].archive_idx
                        
                        self.navigationController?.pushViewController(dvc, animated: true)
                
            }
                
            
            //cell.textLabel?.text = arr[indexPath.row]
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        let titleLabel = UILabel()
        if section == 0{
            titleLabel.text = "새로운 알림"
        }
        else{
            titleLabel.text = "읽은 알림"
        }
        
        titleLabel.frame = CGRect(x: 20, y: 10
            , width:titleLabel.frame.width + 90,
                                  height: 20)
        titleLabel.font = UIFont(name: "NanumBarunGothicBold", size: 18)
        
        view.addSubview(titleLabel)
        
        return view
    }
    
    
    
  
    func getNoti() {
        
        NotiService.shared.getNoti() {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                let _result = result as! [Notification]
                self.notification = _result
//                self.tableView.reloadData()
                print(result)
                
                //섹션나누기
                for num in 0 ... self.notification.count-1 {
                    
                    //안읽은알림
                    if(self.notification[num].isRead == false){
                        self.newNotiNum += 1
                    }else if(self.notification[num].isRead == true){
                        self.readNotiNum += 1
                    }
                    
                    self.notiTable.reloadData()
    
                    
                }
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr in getNoti")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }

}

