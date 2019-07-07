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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         notiTable.delegate = self
         notiTable.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 4
        }else if section == 1{
            return arr.count
        }else{
            return 0
        }
    }
    
    

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath)
            
            //cell.textLabel?.text = arr[indexPath.row]
            
            return cell
        }else{
            
            if isImageCell == true{
                let cell3 = tableView.dequeueReusableCell(withIdentifier: "recoNotification", for: indexPath) as! recoNotificationCell
                
                return cell3
            }else{
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "readNotification", for: indexPath) as! readNotificationCell
                return cell2
            }
            
        }
        
        
    }
    /*override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Today"
        case 1: return "Yesterday"
        default: return nil
        }
    }*/
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
