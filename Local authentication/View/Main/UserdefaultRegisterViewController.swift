//
//  UserdefaultRegisterViewController.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 20/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import UIKit

class UserdefaultRegisterViewController: UIViewController {

     //MARK: - Outlets
      @IBOutlet weak var EmailTextOut: UITextField!
      @IBOutlet weak var PasswordTextOut: UITextField!
      @IBOutlet weak var ConfirmPasswordtextOut: UITextField!
      
      //MARK: - Variables
      var Emailvalidate = false
      var SaveUser = [[String:Any]]()
      var getUser = [[String:Any]]()
      
      //MARK:- backAction
      @IBAction func backAction(_ sender: Any) {
          navigationController?.popViewController(animated: true)
      }
    
      //MARK: - RegisterAction
      @IBAction func RegisterBtnAction(_ sender: Any) {
          Register()
      }
    
}

// MARK: - General Function for This Class
extension UserdefaultRegisterViewController {
    func Register() {
        
        if EmailTextOut.text != "" && PasswordTextOut.text != "" && ConfirmPasswordtextOut.text != "" {
            if Emailvalidation.validateEmail(enteredEmail: EmailTextOut.text ?? "") == true {
                
                if PasswordTextOut.text == ConfirmPasswordtextOut.text {
                    let LoginArray = ["Email":EmailTextOut.text ?? "","password":PasswordTextOut.text ?? ""]
                    
                    SaveUserInfo.SaveUserInfo(values: LoginArray, key: "UserInfo")
                    let vc = storyboard?.instantiateViewController(withIdentifier: "LogginSuccessViewController") as? LogginSuccessViewController
                    vc?.check = 3
                    vc?.UserdefaultEmail = EmailTextOut.text!
                    navigationController?.pushViewController(vc!, animated: true)
                }else{
                    Alert.basicAlert(Title: "Sorry", Message: "your password do not match", ViewController: self)
                }
                
            }else{
                Alert.basicAlert(Title: "Sorry", Message: "your email is not valid", ViewController: self)
            }
        }else{
            
            if EmailTextOut.text == ""{
                Alert.basicAlert(Title: "Sorry", Message: "your email is not valid", ViewController: self)
            }else if PasswordTextOut.text == "" {
                Alert.basicAlert(Title: "Sorry", Message: "Enter your password", ViewController: self)
            }else if ConfirmPasswordtextOut.text == "" {
                Alert.basicAlert(Title: "Sorry", Message: "enter your ConfirmPassword", ViewController: self)
            }
        }
    }
    
}

// MARK: - lifecycle
extension UserdefaultRegisterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUser.append(GetUserInfo.GetUserInfo(key: "UserInfo") as? [String : Any] ?? [:])
        print(getUser)
    }
}
