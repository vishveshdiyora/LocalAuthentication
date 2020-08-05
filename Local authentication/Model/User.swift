//
//  User.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 17/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import Foundation
import RealmSwift

class User:Object{
    @objc dynamic var email = ""
    @objc dynamic var password = ""
}
