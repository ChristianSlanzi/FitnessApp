//
//  LoginViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 29.10.20.
//

import UIKit
import CS_Common_UI
import CS_LoginModule
import CS_CoreModule

class LoginViewController: BaseViewController, LoginView {
    func display(message: WelcomeMessage) {
        //TODO: show a welcome message
        print()
        print(message.message)
        
        Alert.present(title: "Welcome!!!", message: message.message, actions: .okay(handler: {
            //move to home screen
            self.loginCoordinator?.userLoggedIn()
        }), from: self)
        
    }
    
    func display(message: ErrorMessage) {
        //TODO: show a error message
        print("Error!!!")
        print(message.message)
        Alert.present(title: "Error!!!", message: message.message, actions: .close, from: self)
    }
    
    //coordinator
    public weak var loginCoordinator: LoginViewControllerCoordinatorDelegate?
    public weak var signupCoordinator: CreatingAccount?
    
    // MARK: Properties Dependency Injection
    var presenter: LoginPresenter!
    var loginUseCase: LoginUseCase!
    
    // MARK: Views
    lazy var logoIconImageView: UIImageView = {
       let logoIconImageView = UIImageView()
        logoIconImageView.translatesAutoresizingMaskIntoConstraints = false
        logoIconImageView.image = UIImage(named: "Logo_icon")
        logoIconImageView.contentMode = .scaleAspectFit
        return logoIconImageView
    }()
    
    lazy var emailTextField: UITextField = {
       let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        //give it a frame or underlined custom layout won't work
        emailTextField.frame = CGRect(x: 0, y: 0, width: view.frame.size.width*0.9, height: 60)
        emailTextField.underlined()
        return emailTextField
    }()
    
    lazy var passwordTextField: UITextField = {
       let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        //give it a frame or underlined custom layout won't work
        passwordTextField.frame = CGRect(x: 0, y: 0, width: view.frame.size.width*0.9, height: 60)
        passwordTextField.underlined()
        return passwordTextField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(hexFromString: "#9013fe")
        button.layer.cornerRadius = 30.0 // height/2
        button.setTitle("Login", for: .normal)
        //button.setUpButton()
        //button.configureColors(for: theme)
        return button
    }()
    
    lazy var signupLabel: TappableLabel = {
        let label = TappableLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        //label.text = "Don't have an account? Signup"
        
        let attributedString = NSMutableAttributedString(string: "Don't have an account? Signup")
        let linkWasSet = attributedString.setAsAction(textToFind: "Signup", colorToSet: UIColor(hexString: "#3EC7E6"))//, linkURL: "")

        label.attributedText = attributedString
        
        return label
    }()
    
    // MARK: Init & Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: move dependency creation outside the view controller
        //TODO: UI should depend only on the presentation
        let loginUseCaseFactory = LoginUseCaseFactory()
        loginUseCase = loginUseCaseFactory.makeUseCase(loginView: self)
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(logoIconImageView)
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)

        view.addSubview(loginButton)
        view.addSubview(signupLabel)
    }
    
    override func setupActions() {
        loginButton.addTarget(self, action: #selector(onLoginButtonSelected(_:)), for: .touchUpInside)
        signupLabel.onCharacterTapped = { label, characterIndex in
            print("Signup Clicked")
            self.onSignupButtonSelected()
        }
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
        logoIconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
        logoIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logoIconImageView.widthAnchor.constraint(equalToConstant: 104),
        logoIconImageView.heightAnchor.constraint(equalToConstant: 104)
        ])
        
        NSLayoutConstraint.activate([
        emailTextField.topAnchor.constraint(equalTo: logoIconImageView.bottomAnchor, constant: 75),
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        emailTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        emailTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        passwordTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        passwordTextField.heightAnchor.constraint(equalToConstant: 60)
        ])

        NSLayoutConstraint.activate([
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        loginButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
        signupLabel.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -60),
        signupLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        signupLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
        ])
    }
}

extension LoginViewController {
    @objc private func onLoginButtonSelected(_ button: UIButton) {
        button.isSelected = true
        //loginCoordinator?.userLoggedIn()
        
        guard let usrText = emailTextField.text, let pswText =  passwordTextField.text else {
            //TODO: test no empty fields, to avoid calling login
            print("username or password wasn't entered")
            return
        }
        login(username: usrText, password: pswText)
    }
    
    @objc private func onSignupButtonSelected() {
        signupCoordinator?.showSignupVC()
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
}
