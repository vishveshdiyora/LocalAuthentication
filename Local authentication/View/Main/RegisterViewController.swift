//
//  RegisterViewController.swift
//  Local authentication
//
//  Created by iMac on 08/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import UIKit
import RealmSwift
import LocalAuthentication

protocol Datapass {
    func datapassing(email:String,password:String)
}

class RegisterViewController: UIViewController,UITextFieldDelegate {
    
    //  MARK: - IBOutlet
    @IBOutlet weak var EmailTextOut: UITextField!
    @IBOutlet weak var PasswordTextOut: UITextField!
    @IBOutlet weak var ConfirmPasswordtextOut: UITextField!
    
    //    MARK: - initialization
    var realm = try! Realm()
    var allUsers = try! Realm().objects(User.self)
    var tempuser = try! Realm().objects(User.self)
    var Emailvalidate = false
    var SaveUser = [[String:Any]]()
    var getUser = [[String:Any]]()
    var delegate : Datapass!
    
    // MARK: - @objc Addtarget,IBAction
    @IBAction func BackBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func RegisterBtnAction(_ sender: Any) {
        Register()
    }
    
    //MARK:- backAction
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - General Function for This Class
extension RegisterViewController {
    func Register() {
        
        if EmailTextOut.text != "" && PasswordTextOut.text != "" && ConfirmPasswordtextOut.text != "" {
            if Emailvalidation.validateEmail(enteredEmail: EmailTextOut.text ?? "") == true {
                
                if PasswordTextOut.text == ConfirmPasswordtextOut.text {
                       
                    let email = EmailTextOut.text!.replacingOccurrences(of: "\"", with: "", options: .literal, range: nil)
                    print(email)
                    tempuser = realm.objects(User.self).filter("email = '\(email)'")
                    print(tempuser.count)
                    
                    if tempuser.count == 0{
                        delegate.datapassing(email: EmailTextOut.text! , password: PasswordTextOut.text!)
                        SaveUserInfo.SaveUserInfo(values: EmailTextOut.text!, key: "LoggedEmail")
                         let vc = storyboard?.instantiateViewController(withIdentifier: "LogginSuccessViewController") as? LogginSuccessViewController
                         navigationController?.pushViewController(vc!, animated: true)
                    }else{
                        Alert.basicAlert(Title: "Already Register", Message: "Email is Already Registered", ViewController: self)
                    }
                    

                }else{
                    Alert.basicAlert(Title: "Sorry", Message: "your password do not match", ViewController: self)
                }
                
            }else{
                Alert.basicAlert(Title: "Sorry", Message: "your email is not valid", ViewController: self)
            }
        }else{
            
            if EmailTextOut.text == ""{
                Alert.basicAlert(Title: "Sorry", Message: "Enter Your email", ViewController: self)
            }else if PasswordTextOut.text == "" {
                Alert.basicAlert(Title: "Sorry", Message: "Enter your password", ViewController: self)
            }else if ConfirmPasswordtextOut.text == "" {
                Alert.basicAlert(Title: "Sorry", Message: "enter your ConfirmPassword", ViewController: self)
            }
        }
    }
    
}

// MARK: - lifecycle
extension RegisterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
   }
   
}
