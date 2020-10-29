//
//  LoginUseCaseFactory.swift
//  CleanArchitectureComposition
//
//  Created by Christian Slanzi on 12.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import Foundation

public final class LoginUseCaseFactory {
    
    public init() {
        
    }
    public func makeUseCase(loginView: LoginView) -> LoginUseCase {
        return LoginUseCase(output: LoginUseCaseOutputComposer([
        //at first it can compose anything, also composers
        //LoginUseCaseOutputComposer([]),
        //LoginUseCaseOutputComposer([]),
        //LoginUseCaseOutputComposer([])
        LoginPresenter(view: loginView),
        CrashlyticsLoginTracker(),
        FirebaseAnalyticsLoginTracker()
        ]))
    }
}
