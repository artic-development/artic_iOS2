//
//  addArchiveContainerView.swift
//  Artic
//
//  Created by admin on 05/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class addArchiveContainerView: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var addArchiveTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addArchiveTableView.delegate = self
        addArchiveTableView.dataSource = self
        

    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addArchiveTableView.dequeueReusableCell(withIdentifier: "addArchiveTableCell") as! addArchiveTableCell
        
        return cell
    }
    
        
    
    
    

}
