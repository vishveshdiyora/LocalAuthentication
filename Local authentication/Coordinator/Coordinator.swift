//
//  Coordinator.swift
//  Local authentication
//
//  Created by Vishvesh ibl@2019 on 17/04/20.
//  Copyright © 2020 Archit Kheni. All rights reserved.
//

import Foundation

protocol Coordinator {
    func start()
}

protocol rootViewController {
    func buildFirstScreen()
}

protocol pushController {
    func pushCryptoKitScreen()
    func pushKeyChainScreen()
    func pushUserDefaultScreen()
    func pushRealmDatabaseScreen()
    func pushTouchIDScreen()
    func pushFaceIDScreen()
}
