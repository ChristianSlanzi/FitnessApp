//
//  CoreModuleExtension.swift
//  CS_CoreModule
//
//  Created by Christian Slanzi on 29.10.20.
//

extension String {
 
    //TODO: Refactor in a localizedIn(_ tableName: String)->String
    // ACCESS LOCALIZED STRING INSIDE MODULE
    var localizedInCoreModule: String {
        return NSLocalizedString(self, tableName: "CoreModuleLocalizable", bundle: Bundle(identifier: "de.test.CS-CoreModule")!, value: "", comment: "")
    }
}
