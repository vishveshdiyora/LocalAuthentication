//
//  CryptoKitRegisterViewController.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 20/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import UIKit
import CryptoKit

class CryptoKitRegisterViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var emialTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    //MARK:- registerAction
    @IBAction func registerAction(_ sender: Any) {
         Register()
    }
    
    //MARK:- backAction
    @IBAction func backAction(_ sender: Any) {
           navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

//MARK:- Register function
extension CryptoKitRegisterViewController{
    func Register() {
        
        if emialTextField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != "" {
            if Emailvalidation.validateEmail(enteredEmail: emialTextField.text ?? "") == true {
                
                if passwordTextField.text == confirmPasswordTextField.text {

                    let hashStringEmail = ConvertTohashString.ConvertTohashString(string: emialTextField.text!)
                    let hashStringPassword = ConvertTohashString.ConvertTohashString(string: passwordTextField.text!)
                    
                    print(hashStringEmail)
                    print(hashStringPassword)
                    let UserInfoKeys = ["emailKey":hashStringEmail,"passwordKey":hashStringPassword]
                    SaveUserInfo.SaveUserInfo(values: UserInfoKeys, key: "UserInfoCryptoKey")
                    let vc = storyboard?.instantiateViewController(withIdentifier: "LogginSuccessViewController") as? LogginSuccessViewController
                    vc?.check = 3
                    vc?.UserdefaultEmail = emialTextField.text!
                    navigationController?.pushViewController(vc!, animated: true)
                }else{
                    Alert.basicAlert(Title: "Sorry", Message: "your password do not match", ViewController: self)
                }
                
            }else{
                Alert.basicAlert(Title: "Sorry", Message: "your email is not valid", ViewController: self)
            }
        }else{
            
            if emialTextField.text == ""{
                Alert.basicAlert(Title: "Sorry", Message: "your email is not valid", ViewController: self)
            }else if passwordTextField.text == "" {
                Alert.basicAlert(Title: "Sorry", Message: "Enter your password", ViewController: self)
            }else if confirmPasswordTextField.text == "" {
                Alert.basicAlert(Title: "Sorry", Message: "enter your ConfirmPassword", ViewController: self)
            }
        }
    }
    
}
