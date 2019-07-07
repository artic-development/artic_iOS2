//
//  SignUpViewNameBirth.swift
//  Artic
//
//  Created by admin on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit

class SignUpViewNameBirth: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var nameValiText: UILabel!
    
    @IBOutlet weak var birthValiText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameValiText.text = " "
        birthValiText.text = " "
        nameTextField.delegate = self
        birthTextField.delegate = self
        
        setTextFieldTarget()
        
        // Do any additional setup after loading the view.
    }
    
    func setTextFieldTarget() {
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        birthTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    

    @objc func textFieldDidChange(_ textField: UITextField) {
        
//        if nameTextField.text?.validateName() == true {
//            nameValiText.text = "사용하실 수 있는 이름입니다"
//            nameValiText.textColor = UIColor.colorWithRGBHex(hex: 0x4f80ff)
//
//        }else{
//            nameValiText.text = "15자 이내로 입력해주세요"
//            nameValiText.textColor = UIColor.colorWithRGBHex(hex: 0xff1515)
//        }
        
        if birthTextField.text?.validateBirth() == true {
            birthValiText.text = "올바른 형식입니다"
            birthValiText.textColor = UIColor.colorWithRGBHex(hex: 0x4f80ff)
            
        }else{
            birthValiText.text = "형식에 맞게 입력해주세요"
            birthValiText.textColor = UIColor.colorWithRGBHex(hex: 0xff1515)
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