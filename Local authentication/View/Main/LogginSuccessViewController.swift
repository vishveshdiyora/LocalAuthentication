//
//  LogginSuccessViewController.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 17/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import UIKit
import LocalAuthentication

let window = UIApplication.shared.windows
let appCoordinator = AppCoordinator(window: window.filter {$0.isKeyWindow}.first!)

class LogginSuccessViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var loggedEmail: UILabel!
    
    //MARK:- Variables
    var check = 0
    var keychainUsername = ""
    var UserdefaultEmail = ""
    
    
    //MARK:- logOutAction
    @IBAction func logOutaction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "LoggedEmail")
        appCoordinator.buildFirstScreen()
    }
    
    //MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        if check == 0{
            loggedEmail.text = UserDefaults.standard.value(forKey: "LoggedEmail") as! String
        }else if check == 2{
            loggedEmail.text = keychainUsername
        }else if check == 3{
            loggedEmail.text = UserdefaultEmail
            
        }
        
    }
    
    
}
