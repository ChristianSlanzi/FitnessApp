//
//  LoginManager.swift
//  Fitness-Notiz
//
//  Created by Christian Slanzi on 18.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import Foundation

public class LoginManager {
    
  public static func saveUserID(_ userID: String?) {
    UserDefaults.standard.set(userID, forKey: "userID")
  }
  
  public static func getUserID() -> String? {
    return UserDefaults.standard.string(forKey: "userID")
  }
}
