//
//  UserdefaultViewController.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 20/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import UIKit

class UserdefaultViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK:- Variables
    var getUser = [[String:Any]]()
    
    //MARK:- loginAction
    @IBAction func loginAction(_ sender: Any) {
        Login()
    }
    
    
    @IBAction func registerAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserdefaultRegisterViewController") as? UserdefaultRegisterViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    //MARK:- backAction
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func Login() {
        var UserLoginInfo = getUser[0] as? [String:Any] ?? [:]
        print(UserLoginInfo["Email"])
        if  Emailvalidation.validateEmail(enteredEmail: emailTextField.text ?? "")  == true {
            if emailTextField.text == UserLoginInfo["Email"] as? String ?? "" && passwordTextField.text == UserLoginInfo["password"] as? String ?? "" {
                let vc = storyboard?.instantiateViewController(withIdentifier: "LogginSuccessViewController") as? LogginSuccessViewController
                vc?.check = 3
                vc?.UserdefaultEmail = emailTextField.text!
                navigationController?.pushViewController(vc!, animated: true)
            }else{
                Alert.basicAlert(Title: "Sorry", Message: "Your Email And Password ", ViewController: self)
            }
            
        }else{
            Alert.basicAlert(Title: "Sorry", Message: "your email is not valid", ViewController: self)
        }
    }
    
    //MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
       getUser.append(GetUserInfo.GetUserInfo(key: "UserInfo") as? [String : Any] ?? [:])
       print(getUser)
        
        
    }
    
}
