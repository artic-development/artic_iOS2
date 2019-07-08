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
    var emailText: String!
    var passText: String!
    
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
    
    @IBAction func completeBtnClicked(_ sender: Any) {
        guard let email = emailText else {return}
        guard let pass = passText else {return}
        guard let birth = birthTextField.text else {return}
        guard let name = nameTextField.text else {return}
        
        AuthService.shared.signUp(email, pass, birth, name){
            data in
            
            switch data {
            case .success(let token):
                UserDefaults.standard.set(token, forKey: "token")
                
                let dvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC") as! UINavigationController
                
                self.present(dvc, animated: true)
                
                break
            case .requestErr(let err):
                self.simpleAlert(title: "회원가입 실패", message: err as! String)
                break
            case .pathErr:
                // 대체로 경로를 잘못 쓴 경우입니다.
                // 오타를 확인해보세요.
                print("경로 에러")
                break
            case .serverErr:
                // 서버의 문제인 경우입니다.
                // 여기에서 동작할 행동을 정의해주시면 됩니다.
                print("서버 에러")
                break
            case .networkFail:
                self.simpleAlert(title: "통신 실패", message: "네트워크 상태를 확인하세요.")
                break
            }
            
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
