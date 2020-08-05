//
//  ViewController.swift
//  Local authentication
//
//  Created by iMac on 08/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import UIKit
import RealmSwift 
import LocalAuthentication

class LoginController: UIViewController ,Datapass{
    
    
    //  MARK: - IBOutlet
    @IBOutlet weak var EmailTextOut: UITextField!
    @IBOutlet weak var PasswordTextOut: UITextField!
    @IBOutlet weak var LoginBtnOut: UIButton!
    
    //    MARK: - initialization
    var getUser = [[String:Any]]()
    var user = User()
    var realm = try! Realm()
    var allUsers = try! Realm().objects(User.self)
    var tempUser = try! Realm().objects(User.self)
    
    // MARK: - @objc Addtarget,IBAction
    @IBAction func LoginBtnAction(_ sender: Any) {
        Login()
    }
    
    //MARK:- backAction
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func RegisterAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        vc?.delegate = self
        vc?.realm = self.realm
        vc?.allUsers = self.allUsers
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func datapassing(email: String, password: String) {
        user.email = email
        user.password = password
        
        try! realm.write{
            realm.add(user)
            allUsers = realm.objects(User.self)
            print(allUsers)
        }
    }
    
}

// MARK: - General Function for This Class
extension LoginController {
    func Login() {
    
        if EmailTextOut.text == "" || PasswordTextOut.text == ""{
            Alert.basicAlert(Title: "Required", Message: "Plase Enter the Data", ViewController: self)
        }else{
            let email = EmailTextOut.text!.replacingOccurrences(of: "\"", with: "", options: .literal, range: nil)
            let password = PasswordTextOut.text!.replacingOccurrences(of: "\"", with: "", options: .literal, range: nil)
            print(email)
            print(password)
            tempUser = realm.objects(User.self).filter("email = '\(email)' AND password ='\(password)'")
            
            print(tempUser.count)
            
            if tempUser.count == 0{
                Alert.basicAlert(Title: "Not Find", Message: "User Not find in database", ViewController: self)
            }else{
                SaveUserInfo.SaveUserInfo(values: EmailTextOut.text!, key: "LoggedEmail")
                let vc = storyboard?.instantiateViewController(withIdentifier: "LogginSuccessViewController") as? LogginSuccessViewController
                navigationController?.pushViewController(vc!, animated: true)
            }
        }
    
    }
}


// MARK: - lifecycle
extension LoginController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        getUser.append(GetUserInfo.GetUserInfo(key: "UserInfo") as? [String : Any] ?? [:])
        print(getUser)
    }
}
