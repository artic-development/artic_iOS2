//
//  ModifyProfile.swift
//  Artic
//
//  Created by admin on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class ModifyProfile: UIViewController {
    @IBOutlet weak var profilePicView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let radius = profilePicView.frame.width / 2
        profilePicView.makeRounded(cornerRadius: radius)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func changePicBtnClicked(_ sender: Any) {
    }
    

}
