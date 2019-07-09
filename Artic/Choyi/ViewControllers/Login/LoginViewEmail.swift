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
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let radius = loginBtnView.frame.height / 2
        loginBtnView.makeRounded(cornerRadius: radius)

        // Do any additional setup after loading the view.
    }
    @IBAction func loginBtnClicked(_ sender: Any) {
        guard let id = emailTextField.text else {return}
        guard let pw = passTextField.text else {return}
        
        AuthService.shared.login(id, pw) {
            data in
            
            switch data {
            case .success(let token):
                let _token = token as! Signin
                //print(_token.token)
                
                UserDefaults.standard.set(_token.token, forKey: "token")
                
                let dvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC")
                self.present(dvc, animated: true)
                
                break
            case .requestErr(let err):
                self.simpleAlert(title: "로그인 실패", message: err as! String)
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
}
