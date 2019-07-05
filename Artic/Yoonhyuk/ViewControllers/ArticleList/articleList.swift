//
//  articleList.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 04/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class articleList: UIViewController, UITableViewDelegate, UITableViewDataSource {
@IBOutlet weak var articleTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleTable.delegate = self
        articleTable.dataSource = self
        
        let nibName = UINib(nibName: "ArticleCell", bundle: nil)
        
        articleTable.register(nibName, forCellReuseIdentifier: "ArticleCell")
        
        
        
        // Do any additional setup after loading the view.
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        
        let cell = articleTable.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
       
        return cell
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
