//
//  AppSettingsManager.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 28.10.20.
//

import Foundation

struct DataKey {
    static let onboardingCompletedKey = "App.isOnboardingCompleted"
}

public class AppSettingsManager {
    
  public static func saveIsOnboardingComplete(_ isOnboardingCompleted: Bool) {
    UserDefaults.standard.set(isOnboardingCompleted, forKey: DataKey.onboardingCompletedKey)
  }
  
  public static func isOnboardingCompleted() -> Bool {
    return UserDefaults.standard.bool(forKey: DataKey.onboardingCompletedKey)
  }
}

//TODO: refactor in a hierarchical and extendible structure of settings management
// - core module settings -> app settings, etc...
