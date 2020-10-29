//
//  LoginPresenter.swift
//  CleanArchitectureComposition
//
//  Created by Christian Slanzi on 12.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import Foundation

public struct WelcomeMessage {
    public let message = "login_success_message".localizedInLoginModule
}

public struct ErrorMessage {
    public let message = "login_error_message".localizedInLoginModule
}

public protocol LoginView {
    func display(message: WelcomeMessage)
    func display(message: ErrorMessage)
}

public final class LoginPresenter: LoginUseCaseOutput {
    // PRESENTER OR VIEW COONTROLLER OR VIEW MODEL,
    // it depends on the architecture design pattern you choosed to implement,
    // MVP, MVVM, MVC in the ui/presentation layer
    var loginView: LoginView
    
    init(view: LoginView) {
        self.loginView = view
    }
    
    func loginSucceded() {
        //create welcome view model and pass it to the view controller
        loginView.display(message: WelcomeMessage())
    }
    
    func loginFailed() {
        // create error view model and pass it to the view controller
        loginView.display(message: ErrorMessage())
    }
}
