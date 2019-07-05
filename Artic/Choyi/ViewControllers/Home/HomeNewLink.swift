//
//  HomeNewLink.swift
//  Artic
//
//  Created by admin on 05/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class HomeNewLink: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var newLinkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        newLinkTableView.delegate = self
        newLinkTableView.dataSource = self
        newLinkTableView.separatorStyle = .none
        
        let nibName = UINib(nibName: "homeArcitleXibCell", bundle: nil)
        newLinkTableView.register(nibName, forCellReuseIdentifier: "homeArcitleXibCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeArcitleXibCell", for: indexPath) as! homeArcitleXibCell
        return cell
        
    }
    

}
