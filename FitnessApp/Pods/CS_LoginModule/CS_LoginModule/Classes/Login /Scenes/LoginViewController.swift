//
//  ViewController.swift
//  CleanArchitectureComposition
//
//  Created by Christian Slanzi on 12.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import UIKit

//TODO: move under coordinator-actions
public protocol LoginViewControllerCoordinatorDelegate: AnyObject {
    //func didPressSignupButton()
    func userLoggedIn()
}

public class LoginViewController: UIViewController, LoginView {
    
    //coordinator
    public weak var coordinator: LoginViewControllerCoordinatorDelegate?
    
    // MARK: Properties Dependency Injection
    var presenter: LoginPresenter!
    var loginUseCase: LoginUseCase!
    
    //IBOutlets
    @IBOutlet weak var forgotPswButton: UIButton!
    @IBOutlet weak var usernameTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, .underlineStyle: 1]
        let attributedString = NSAttributedString(string: "login_pswd_forgot".localizedInLoginModule, attributes: attributes)
        
        forgotPswButton.setAttributedTitle(attributedString, for: .normal)
        
        //TODO: move dependency creation outside the view controller
        //TODO: UI should depend only on the presentation
        let loginUseCaseFactory = LoginUseCaseFactory()
        loginUseCase = loginUseCaseFactory.makeUseCase(loginView: self)
        
    }

    @IBAction func onLoginButtonPressed(_ sender: Any) {
        guard let usrText = usernameTextField.text, let pswText =  passwordTextField.text else {
            print("username or password wasn't entered")
            return
        }
        login(username: usrText, password: pswText)
    }
    
    func login(username: String, password: String) {
        
        //TODO: call async api or ....
        
        //fake implementation, all not empty username and password are valid
        
        //TODO: prevalidate the input?
        /*
        var isValidated = true
        if username.isEmpty || password.isEmpty {
            isValidated = false
        }
        
        if !isValidated {
            //display validation error message
        } else {
            loginUseCase.login(name: username, password: password)
        }
        */
        loginUseCase.login(name: username, password: password)

    }
    
    // MARK: LoginView protocol
    public func display(message: WelcomeMessage) {
        print(message.message)
        
        //move to home screen
        coordinator?.userLoggedIn()
    }
    
    public func display(message: ErrorMessage) {
        print(message.message)
    }
}
