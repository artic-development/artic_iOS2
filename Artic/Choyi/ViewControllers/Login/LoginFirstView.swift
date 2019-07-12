//
//  LoginFirstView.swift
//  Artic
//
//  Created by admin on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import Lottie

class LoginFirstView: UIViewController {

    @IBOutlet weak var emailLoginBtnView: UIView!
    @IBOutlet weak var fbLoginBtnView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let radius = emailLoginBtnView.frame.height / 2
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "commonBackBlack")
        
        emailLoginBtnView.makeRounded(cornerRadius: radius)
        emailLoginBtnView.setBorder(borderColor: UIColor.colorWithRGBHex(hex: 0x707070), borderWidth: 1)
        
        fbLoginBtnView.makeRounded(cornerRadius: radius)
        
        self.navigationController?.navigationBar.tintColor = UIColor.colorWithRGBHex(hex: 0xcdcdcd)
        
        self.navigationController?.navigationBar.barTintColor = .white
        
       
       

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
        @IBAction func unwindLogin(segue: UIStoryboardSegue) {    }
    
    
    
    

}
