//
//  VersionInfo.swift
//  Artic
//
//  Created by admin on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class VersionInfo: UIViewController {


    @IBOutlet weak var btnView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnView.makeRounded(cornerRadius: 2)
        btnView.setBorder(borderColor: UIColor.colorWithRGBHex(hex: 0x707070), borderWidth: 1)

        // Do any additional setup after loading the view.
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
