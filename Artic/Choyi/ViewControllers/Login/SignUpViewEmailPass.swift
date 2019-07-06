//
//  SignUpViewEmailPass.swift
//  Artic
//
//  Created by admin on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class SignUpViewEmailPass: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "commonBackBlack")
        //addNavigationBarButton(imageName: "commonBackBlack", direction:.left)

        // Do any additional setup after loading the view.
    }
    

    func addNavigationBarButton(imageName:String,direction:direction){
        var image = UIImage(named: imageName)
        image = image?.withRenderingMode(.alwaysOriginal)
        switch direction {
        case .left:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action: #selector(goBack))
        case .right:
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action: #selector(goBack))
        }
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    enum direction {
        case right
        case left
    }

}
