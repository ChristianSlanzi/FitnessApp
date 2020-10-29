//
//  LoginUseCaseOutputComposer.swift
//  CleanArchitectureComposition
//
//  Created by Christian Slanzi on 12.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    
    let outputs: [LoginUseCaseOutput]
    
    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }
    
    func loginSucceded() {
        //outputs.first?.loginSucceded()
        outputs.forEach { $0.loginSucceded() }
    }
    
    func loginFailed() {
        //outputs.first?.loginFailed()
        outputs.forEach { $0.loginFailed() }
    }
    
}
