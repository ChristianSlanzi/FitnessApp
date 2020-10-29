//
//  LoginModuleExtensions.swift
//  Fitness-Notiz
//
//  Created by Christian Slanzi on 23.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import Foundation

// STRING FUNCTIONS
extension String {
 
    //TODO: Refactor in a localizedIn(_ tableName: String)->String
    // ACCESS LOCALIZED STRING INSIDE MODULE
    var localizedInLoginModule: String {
        return NSLocalizedString(self, tableName: "LoginModuleLocalizable", bundle: Bundle(identifier: "de.test.LoginModule")!, value: "", comment: "")
    }
}
