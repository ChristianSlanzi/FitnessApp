//
//  User.swift
//  FitGoal
//
//  Created by Christian Slanzi on 26.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import Foundation
import RealmSwift

class UserAccount: Object {
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var password = ""
    let ofUser = LinkingObjects(fromType: User.self, property: "userAccount")
    
    convenience init(_ name: String, _ email: String, _ password: String) {
        self.init()
        self.name = name
        self.email = email
        self.password = password
    }
}

class UserProfile: Object {
    @objc dynamic var gender = Gender.man
    @objc dynamic var age = 0
    @objc dynamic var height = 0
    @objc dynamic var weight = 0.0
    let ofUser = LinkingObjects(fromType: User.self, property: "userProfile")
    
    convenience init(_ gender: Gender, age: Int, height: Int, weight: Double) {
        self.init()
        self.gender = gender
        self.age = age
        self.height = height
        self.weight = weight
    }
}

class User: Object {
    @objc dynamic var firstName = ""
    @objc dynamic var userId = 0
    @objc dynamic var userAccount: UserAccount?  //TODO: optional or not?
    @objc dynamic var userProfile: UserProfile?
    
    override static func primaryKey() -> String? {
        return "userId"
    }
    
    convenience init(_ firstName: String, _ userId: Int) {
        self.init()
        self.firstName = firstName
        self.userId = userId
    }
    
    convenience init(_ firstName: String, _ userdId: Int, _ userAccount: UserAccount, _ userProfile: UserProfile) {
        self.init()
        self.firstName = firstName
        self.userId = userdId
        self.userAccount = userAccount
        self.userProfile = userProfile
    }
    
}
