//
//  AppCoordinator.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 17/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//
import UIKit
import Foundation
import LocalAuthentication

class AppCoordinator:NSObject,Coordinator {
    
    var window: UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    func start() {
        buildFirstScreen()
    }
    
    
}

extension AppCoordinator:rootViewController{
    
    func buildFirstScreen(){
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
        window.rootViewController = UINavigationController(rootViewController: vc!)
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator:pushController{
    
    
    func pushCryptoKitScreen() {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
        let navVC = UINavigationController(rootViewController: vc!)
        let pushVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CryptoKitLoginViewController") as? CryptoKitLoginViewController
        navVC.pushViewController(pushVC!, animated: true)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
       
    }
    
    func pushKeyChainScreen() {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
        let navVC = UINavigationController(rootViewController: vc!)
        let pushVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "KeychainLoginViewController") as?   KeychainLoginViewController
        navVC.pushViewController(pushVC!, animated: true)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
    }
    
    func pushRealmDatabaseScreen() {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
        let navVC = UINavigationController(rootViewController: vc!)
        let pushVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginController") as? LoginController
        navVC.pushViewController(pushVC!, animated: true)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
    }
    
    func pushUserDefaultScreen() {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
        let navVC = UINavigationController(rootViewController: vc!)
        let pushVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserdefaultViewController") as? UserdefaultViewController
        navVC.pushViewController(pushVC!, animated: true)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
    }
    
    func pushTouchIDScreen() {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
        let navVC = UINavigationController(rootViewController: vc!)
        let pushVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BiomatricViewController") as? BiomatricViewController
        pushVC?.biomatrixType = LABiometryType.touchID
        navVC.pushViewController(pushVC!, animated: true)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
    }
    
    func pushFaceIDScreen() {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
        let navVC = UINavigationController(rootViewController: vc!)
        let pushVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BiomatricViewController") as? BiomatricViewController
        pushVC?.biomatrixType = LABiometryType.faceID
        navVC.pushViewController(pushVC!, animated: true)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
    }
    
    
}
