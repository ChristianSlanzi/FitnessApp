//
//  FirebaseAnalyticsLoginTracker.swift
//  CleanArchitectureComposition
//
//  Created by Christian Slanzi on 12.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import Foundation

class FirebaseAnalyticsLoginTracker: LoginUseCaseOutput {
    func loginSucceded() {
        // send login event to firebase
    }
    
    func loginFailed() {
        // send error to firebase
    }
}
