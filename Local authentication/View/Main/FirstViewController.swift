//
//  FirstViewController.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 17/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    //MARK:- Action
    @IBAction func CryptoKitAction(_ sender: Any) {
        appCoordinator.pushCryptoKitScreen()
    }
    
    @IBAction func KeychainAction(_ sender: Any) {
        appCoordinator.pushKeyChainScreen()
    }
    
    
    @IBAction func realmdatabaseAction(_ sender: Any) {
        appCoordinator.pushRealmDatabaseScreen()
    }
    
    @IBAction func UserDefaultAction(_ sender: Any) {
        appCoordinator.pushUserDefaultScreen()
    }
    

    @IBAction func TouchIdAction(_ sender: Any) {
        appCoordinator.pushTouchIDScreen()
    }
    
    
    @IBAction func FaceIdAction(_ sender: Any) {
        appCoordinator.pushFaceIDScreen()
    }
    
    
    //MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    

    
}
