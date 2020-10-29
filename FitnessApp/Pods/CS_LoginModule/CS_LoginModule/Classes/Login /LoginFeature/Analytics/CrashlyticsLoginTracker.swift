//
//  CrashlyticsLoginTracker.swift
//  CleanArchitectureComposition
//
//  Created by Christian Slanzi on 12.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import Foundation

class CrashlyticsLoginTracker: LoginUseCaseOutput {
    func loginSucceded() {
        // send login event to crashlytics
    }
    
    func loginFailed() {
        // send error to crashlytics
    }
    
}
