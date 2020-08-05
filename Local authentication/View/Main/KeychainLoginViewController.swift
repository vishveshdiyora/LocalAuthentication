//
//  KeychainLoginViewController.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 20/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import UIKit

//MARK:- Keychain Configuration
struct KeychainConfiguration {
  static let serviceName = "Local authentication"
  static let accessGroup: String? = nil
}

class KeychainLoginViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createInfoLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK:- Variables
    var passwordItems: [KeychainPasswordItem] = []
    let createLoginButtonTag = 0
    let loginButtonTag = 1

       //MARK:- backAction
       @IBAction func backAction(_ sender: Any) {
           navigationController?.popViewController(animated: true)
       }
    
    
    
    //MARK:- LoginAction
    @IBAction func loginAction(_ sender: UIButton) {
       
        guard let newAccountName = usernameTextField.text,
          let newPassword = passwordTextField.text,
          !newAccountName.isEmpty,
          !newPassword.isEmpty else {
            showLoginFailedAlert()
            return
        }
          
       
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
          
        
        if sender.tag == createLoginButtonTag {
          
          let hasLoginKey = UserDefaults.standard.bool(forKey: "hasLoginKey")
          if !hasLoginKey && usernameTextField.hasText {
            UserDefaults.standard.setValue(usernameTextField.text, forKey: "username")
          }
            
         
          do {
            
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: newAccountName,
                                                    accessGroup: KeychainConfiguration.accessGroup)
              
            
            try passwordItem.savePassword(newPassword)
          } catch {
            fatalError("Error")
          }
            
         
          UserDefaults.standard.set(true, forKey: "hasLoginKey")
          loginButton.tag = loginButtonTag
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogginSuccessViewController") as? LogginSuccessViewController
          vc?.check = 2
          vc?.keychainUsername = (UserDefaults.standard.value(forKey: "username") as? String)!
          self.navigationController?.pushViewController(vc!, animated: true)
        } else if sender.tag == loginButtonTag {
           
          if checkLogin(username: newAccountName, password: newPassword) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogginSuccessViewController") as? LogginSuccessViewController
            vc?.check = 2
            vc?.keychainUsername = (UserDefaults.standard.value(forKey: "username") as? String)!
            self.navigationController?.pushViewController(vc!, animated: true)
          } else {
            showLoginFailedAlert()
          }
        }
    }
    
    //MARK:- checkLogin function
    func checkLogin(username: String, password: String) -> Bool {
      guard username == UserDefaults.standard.value(forKey: "username") as? String else {
        return false
      }
        
      do {
        let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                account: username,
                                                accessGroup: KeychainConfiguration.accessGroup)
        let keychainPassword = try passwordItem.readPassword()
        return password == keychainPassword
      } catch {
        fatalError("Error")
      }
    }
    
    private func showLoginFailedAlert() {
      let alertView = UIAlertController(title: "Login Problem",
                                        message: "Wrong username or password.",
                                        preferredStyle:. alert)
      let okAction = UIAlertAction(title: "Retry", style: .default)
      alertView.addAction(okAction)
      present(alertView, animated: true)
    }
    
    //MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let hasLogin = UserDefaults.standard.bool(forKey: "hasLoginKey")
            
        
        if hasLogin {
          loginButton.setTitle("Login", for: .normal)
          loginButton.tag = loginButtonTag
          createInfoLabel.isHidden = true
        } else {
          loginButton.setTitle("Create", for: .normal)
          loginButton.tag = createLoginButtonTag
          createInfoLabel.isHidden = false
        }
            
        
        if let storedUsername = UserDefaults.standard.value(forKey: "username") as? String {
          usernameTextField.text = storedUsername
        }
    }
    

}
