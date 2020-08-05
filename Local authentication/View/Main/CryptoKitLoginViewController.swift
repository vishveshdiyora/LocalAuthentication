//
//  CryptoKitLoginViewController.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 20/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import UIKit

class CryptoKitLoginViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK:- Variables
    var getUser = [[String:Any]]()
    
    
    //MARK:- loginAction
    @IBAction func loginAction(_ sender: Any) {
        Login()
    }
    
    //MARK:- backAction
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK:- registerAction
    @IBAction func registerAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CryptoKitRegisterViewController") as? CryptoKitRegisterViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    //MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUser.append(GetUserInfo.GetUserInfo(key: "UserInfoCryptoKey") as? [String : Any] ?? [:])
        print(getUser)
    }
    

}

//MARK:- Login Function
extension CryptoKitLoginViewController{
    func Login() {
        var UserLoginInfo = getUser[0] as? [String:Any] ?? [:]
        print(UserLoginInfo["emailKey"])
        if  Emailvalidation.validateEmail(enteredEmail: emailTextField.text ?? "")  == true {
            
            let hashStringEmail = ConvertTohashString.ConvertTohashString(string: emailTextField.text!)
            let hashStringPassword = ConvertTohashString.ConvertTohashString(string: passwordTextField.text!)
            print(hashStringEmail)
            print(hashStringPassword)
            if hashStringEmail == UserLoginInfo["emailKey"] as? String ?? "" &&
                hashStringPassword == UserLoginInfo["passwordKey"] as? String ?? "" {
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
}
