//
//  LoginUseCase.swift
//  CleanArchitectureComposition
//
//  Created by Christian Slanzi on 12.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSucceded()
    func loginFailed()
}

//class LoginUseCase {
//    func login(name: String, password: String) {
//
//    }
//}

/*
final class LoginUseCase {
    let crashlyticsTracker: LoginUseCaseOutput
    let firebaseTracker: LoginUseCaseOutput
    let loginPresenter: LoginUseCaseOutput
    
    init(all trackers ) {
    
}
    func login(name: String, password: String) {
        crashlyticsTracker.loginSucceded()
        firebaseTracker.loginSucceded()
        loginPresenter.loginSucceded()
    }
}
*/ //NOT GOOD, WE CREATE DEPENDENCIES

/*
final class LoginUseCase {
    let outputs: [LoginUseCaseOutput]
    
    init(outputs: [LoginUseCaseOutput] ) {
    
    }
    func login(name: String, password: String) {
        if success {
            for output in outputs {
                output.loginSucceded()
            }
        } else {
          for output in outputs {
                output.loginFailed()
            }
        }
    }
}
*/ //NOT GOOD EITHER, STILL HAVING IMPLICIT DEPENDENCIES AND RESPONSABILITY

//we dont want to introduce concrete dependencies in the model, so that loginusecase needs to create instancies of each tracker. We could have an array of generic LoginUseCaseOutputs, but we dont even want to have the composition inside the business object that makes it responsible to loop on all outputs. We want to have only one output and move the composition outside of the use case model.
//so we make the class as final, we dont want to extend it, and we add a single output

public final class LoginUseCase {
    let output: LoginUseCaseOutput
    
    init(output: LoginUseCaseOutput ) {
        self.output = output
    }
    public func login(name: String, password: String) {
        var success = true
        if name.isEmpty || password.isEmpty {
            success = false
        }
        //todo: async call...
        
        if success {
            LoginManager.saveUserID(name)
            output.loginSucceded()
        } else {
            output.loginFailed()
        }
    }
}
