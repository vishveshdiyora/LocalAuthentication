//
//  BiomatricViewController.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 20/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import UIKit
import LocalAuthentication

class BiomatricViewController: UIViewController {

    
    //MARK:- Outlets
    @IBOutlet weak var biomatricNameBTN: UIButton!
    
    
    //MARK:- Variables
    var biomatrixType : LABiometryType?
    var error : NSError?
    
    //MARK:- backAction
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    //MARK:- BiomatricAction
    @IBAction func BiomatricAction(_ sender: Any) {
        
        
        if biomatrixType == LABiometryType.touchID {
            let context = LAContext()
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                                  
                                  
                                if (context.biometryType == LABiometryType.touchID) {
                                       let reason = "Authinticate Yourself!"
                                    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){
                                    success,errors in
                                    DispatchQueue.main.async {
                                                if success{
                                                      let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogginSuccessViewController") as? LogginSuccessViewController
                                                        vc?.check = 1
                                                    self.navigationController?.pushViewController(vc!, animated: true)
                                                }else{
                                                        Alert.basicAlert(Title: "Wrong!!", Message: "Your ID is Wrong please try Again", ViewController: self)
                                                }
                                    }

                                    }
                                }else{
                                    Alert.basicAlert(Title: "Not Support", Message: "Touch ID is not support in this device", ViewController: self)
                                }
            }else{
                Alert.basicAlert(Title: "Not Found", Message: "Your Device is has support for Touch Id Or Face Id", ViewController: self)
            }
                                  
                                
    }else if biomatrixType == LABiometryType.faceID {
        let context = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                              
                              
            if (context.biometryType == LABiometryType.faceID) {
                                   let reason = "Authinticate Yourself!"
                                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){
                                success,errors in
                                DispatchQueue.main.async {
                                            if success{
                                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogginSuccessViewController") as? LogginSuccessViewController
                                                vc?.check = 1
                                                self.navigationController?.pushViewController(vc!, animated: true)
                                            }else{
                                                    Alert.basicAlert(Title: "Wrong!!", Message: "Your ID is Wrong please try Again", ViewController: self)
                                            }
                                }

                                }
                            }else{
                                Alert.basicAlert(Title: "Not Support", Message: "Face ID is not support in this device", ViewController: self)
                            }
        }else{
            Alert.basicAlert(Title: "Not Found", Message: "Your Device is has support for Touch Id Or Face Id", ViewController: self)
        }
            
        }
                  
 
        
        
        
    }
    
    //MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if biomatrixType == LABiometryType.touchID {
            biomatricNameBTN.setTitle("   Touch ID Authentication   ", for: .normal)
        }else if biomatrixType == LABiometryType.faceID {
            biomatricNameBTN.setTitle("   Face ID Authentication   ", for: .normal)
        }
   
    }


}
