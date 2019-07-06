//
//  LoginViewEmail.swift
//  Artic
//
//  Created by admin on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class LoginViewEmail: UIViewController {

    @IBOutlet weak var loginBtnView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let radius = loginBtnView.frame.height / 2
        loginBtnView.makeRounded(cornerRadius: radius)

        // Do any additional setup after loading the view.
    }

}
