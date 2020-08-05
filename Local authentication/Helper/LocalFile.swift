//
//  Alert.swift
//  ErrorHandalingDemo
//
//  Created by Jay Jariwala on 17/07/19.
//  Copyright © 2019 iBL Infotech. All rights reserved.
//

import Foundation
import UIKit
import CryptoKit

class Alert {
    class func basicAlert(Title title:String, Message message: String, ViewController vCnt:UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vCnt.present(alert, animated: true, completion: nil)
    }
}

class Emailvalidation {
    class func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
}

class SaveUserInfo {
    class func SaveUserInfo(values : Any,key : String) {
        let UD = UserDefaults.standard
        UD.set(values, forKey: key)
        print(UserDefaults.standard.value(forKey: key))
    }
}

class GetUserInfo {
    class func GetUserInfo(key:String) -> Any {
        let UD = UserDefaults.standard
        let GST = UD.value(forKey: key)
        
        return GST
    }
}

class ConvertTohashString{
    class func  ConvertTohashString(string:String) -> String {
        let inputString = Data(string.utf8)
        let hashed = SHA256.hash(data: inputString)
        let hashString = hashed.compactMap { String(format: "%02x", $0) }.joined()
        return hashString
    }
}


