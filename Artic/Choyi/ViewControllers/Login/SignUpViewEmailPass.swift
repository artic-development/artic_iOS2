//
//  SignUpViewEmailPass.swift
//  Artic
//
//  Created by admin on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class SignUpViewEmailPass: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailValiText: UILabel!
    @IBOutlet weak var passValiText: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailValiText.text = " "
        passValiText.text = " "
        emailTextField.delegate = self
        passTextField.delegate = self
        
        setTextFieldTarget()
        
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "commonBackBlack")
        //addNavigationBarButton(imageName: "commonBackBlack", direction:.left)

        // Do any additional setup after loading the view.
    }
    
    func setTextFieldTarget() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        if emailTextField.text?.validateEmail() == true {
            emailValiText.text = "사용하실 수 있는 이메일입니다"
            emailValiText.textColor = UIColor.colorWithRGBHex(hex: 0x4f80ff)
            
        }else{
            emailValiText.text = "이메일 형식에 맞게 입력해주세요"
            emailValiText.textColor = UIColor.colorWithRGBHex(hex: 0xff1515)
        }
        
        if passTextField.text?.validatePassword() == true {
            passValiText.text = "사용하실 수 있는 비밀번호입니다"
            passValiText.textColor = UIColor.colorWithRGBHex(hex: 0x4f80ff)
            
        }else{
            passValiText.text = "영문, 숫자 포함 8자리 이상의 비밀번호를 입력해주세요"
            passValiText.textColor = UIColor.colorWithRGBHex(hex: 0xff1515)
        }
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
