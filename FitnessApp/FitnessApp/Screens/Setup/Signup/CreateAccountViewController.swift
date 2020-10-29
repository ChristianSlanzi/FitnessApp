//
//  CreateAccountViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 29.10.20.
//

import UIKit
import CS_Common_UI

class CreateAccountViewController: BaseViewController {
    
    public weak var signupCoordinator: CreatingAccount?
    
    //////////////////////////////////////////////////////
    //TODO: export in a viewmodel
    let dbManager: DataManager
    let userRepo: UserRepositoryProtocol
    
    init(dbManager: DataManager = RealmDataManager(RealmProvider.default)) {
         self.dbManager = dbManager
         self.userRepo = UserRepository(dbManager: dbManager)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //////////////////////////////////////////////////////
    
    lazy var logoIconImageView: UIImageView = {
       let logoIconImageView = UIImageView()
        logoIconImageView.translatesAutoresizingMaskIntoConstraints = false
        logoIconImageView.image = UIImage(named: "Profile")
        logoIconImageView.contentMode = .scaleAspectFit
        return logoIconImageView
    }()
    
    lazy var titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .darkGray
        titleLabel.font = .systemFont(ofSize: 34)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    lazy var nameTextField: UITextField = {
       let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Name"
        //give it a frame or underlined custom layout won't work
        nameTextField.frame = CGRect(x: 0, y: 0, width: view.frame.size.width*0.9, height: 60)
        nameTextField.underlined()
        return nameTextField
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
    
    lazy var confirmPswdTextField: UITextField = {
       let confirmPswdTextField = UITextField()
        confirmPswdTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPswdTextField.placeholder = "Confirm Password"
        //give it a frame or underlined custom layout won't work
        confirmPswdTextField.frame = CGRect(x: 0, y: 0, width: view.frame.size.width*0.9, height: 60)
        confirmPswdTextField.underlined()
        return confirmPswdTextField
    }()
    
    private lazy var createAccountButton: UIButton = {
        let createAccountButton = UIButton()
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.backgroundColor = UIColor(hexFromString: "#9013fe")
        createAccountButton.layer.cornerRadius = 30.0 // height/2
        createAccountButton.setTitle("Create account", for: .normal)
        //createAccountButton.setUpButton()
        //createAccountButton.configureColors(for: theme)
        return createAccountButton
    }()
    
    lazy var signinLabel: TappableLabel = {
        let label = TappableLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        //label.text = "Already onboard? Login"
        
        let attributedString = NSMutableAttributedString(string: "Already onboard? Login")
        let linkWasSet = attributedString.setAsAction(textToFind: "Login", colorToSet: UIColor(hexString: "#3EC7E6"))

        label.attributedText = attributedString
        label.onCharacterTapped = { label, characterIndex in
            print("Login Clicked")
            self.signupCoordinator?.showLoginVC()
        }
        
        return label
    }()
    
    // MARK: Init & Setup
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(logoIconImageView)
        
        titleLabel.text = "SIGNUP"
        view.addSubview(titleLabel)
        
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPswdTextField)

        view.addSubview(createAccountButton)
        view.addSubview(signinLabel)
    }
    
    override func setupActions() {
        createAccountButton.addTarget(self, action: #selector(onCreateAccountButtonSelected(_:)), for: .touchUpInside)
    }
    @objc func onCreateAccountButtonSelected(_ button: UIButton) {
        
        guard let emailText = emailTextField.text, emailText.isEmpty == false,
            let nameText = nameTextField.text, nameText.isEmpty == false,
            let pswText = passwordTextField.text, pswText.isEmpty == false,
            let confirmPswdText = confirmPswdTextField.text, confirmPswdText.isEmpty == false
        else {
            //TODO: test no empty fields, to avoid calling login
            print("username or password wasn't entered")
            return
        }
        
        createAccount(nameText, emailText, pswText)
        signupCoordinator?.showProfileCreation()
    }
    
    //TODO: export logic in a view model... create a manager... let's see
    //////////////////////////////////////////////////////
    func createAccount(_ name: String, _ email: String, _ pswd: String) {
        //TODO: get unique userId..
        var newUserId = 0
        userRepo.getAllUsers(on: nil, completionHandler: { (users) in
            newUserId = users.count + 1
        })
        let user = UserDTO(firstName: name,
                           userId: newUserId,
                           userAccount: UserAccountDTO(name: name, email: email, password: pswd),
                           userProfile: nil)
        userRepo.saveUser(user: user)
        
        //userRepo.getAllUsers(on: Sorted(key: "firstName", ascending: true), completionHandler: { (users) in
        //print("userId: \(users[0].userId), firstName: \(users[0].firstName)")
        //})
        userRepo.getAllUsers(on: Sorted(key: "userId", ascending: true), completionHandler: { (users) in
            for user in users {
                print("userId: \(user.userId), firstName: \(user.firstName)")
            }
            
        })
    }
    //////////////////////////////////////////////////////
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
        logoIconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
        logoIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logoIconImageView.widthAnchor.constraint(equalToConstant: 104),
        logoIconImageView.heightAnchor.constraint(equalToConstant: 104)
        ])
        
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: logoIconImageView.bottomAnchor, constant: 23),
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        titleLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        titleLabel.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        NSLayoutConstraint.activate([
        nameTextField.topAnchor.constraint(equalTo: logoIconImageView.bottomAnchor, constant: 75),
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        nameTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        nameTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
        nameTextField.topAnchor.constraint(equalTo: logoIconImageView.bottomAnchor, constant: 75),
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        nameTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        nameTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
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
        confirmPswdTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
        confirmPswdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        confirmPswdTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        confirmPswdTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
        createAccountButton.topAnchor.constraint(equalTo: confirmPswdTextField.bottomAnchor, constant: 25),
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        createAccountButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        createAccountButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
        signinLabel.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -60),
        signinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        signinLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
        ])
    }
}
