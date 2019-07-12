//
//  SplashViewController.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 13/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    @IBOutlet var SplashView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSplash()

        // Do any additional setup after loading the view.
    }
    private func setUpSplash() {
        let animationView = AnimationView(name: "splash")
        
        animationView.frame = SplashView.frame
        self.SplashView.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        let bottom = animationView.bottomAnchor.constraint(equalTo: SplashView.bottomAnchor)
        let top = animationView.topAnchor.constraint(equalTo: SplashView.topAnchor)
        let leading = animationView.leadingAnchor.constraint(equalTo: SplashView.leadingAnchor)
        let trailing = animationView.trailingAnchor.constraint(equalTo: SplashView.trailingAnchor)
        SplashView.addConstraints([top, bottom, leading, trailing])
        
        animationView.play{ (finished) in
            guard let dvc = UIStoryboard(name: "LoginSB", bundle: nil).instantiateViewController(withIdentifier: "LoginFirstView")  as? LoginFirstView else { return }
            self.present(dvc, animated: true)


   


}
}
}
