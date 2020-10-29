//
//  SignupViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 29.10.20.
//

import UIKit
import CS_Common_UI

class SignupViewController: BaseViewController {
    
    public weak var signupCoordinator: CreatingAccount?
    
    //TODO: refactor in a view model
    public var titleText: String?
    public var descriptionText: String?
    
    // MARK: Views
    
    lazy var logoIconImageView: UIImageView = {
       let logoIconImageView = UIImageView()
        logoIconImageView.translatesAutoresizingMaskIntoConstraints = false
        logoIconImageView.image = UIImage(named: "Logo_icon")
        logoIconImageView.contentMode = .scaleAspectFit
        return logoIconImageView
    }()
    
    lazy var titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .darkGray
        titleLabel.font = .systemFont(ofSize: 36)
        return titleLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
       let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = .lightGray
        descriptionLabel.font = .systemFont(ofSize: 18)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textAlignment = .center
        return descriptionLabel
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
        
    // MARK: Init & Setup
    
    override func setupViews() {
        super.setupViews()
        
        //TODO:
        view.addSubview(logoIconImageView)
        // title
        titleLabel.text = titleText
        view.addSubview(titleLabel)
        
        // description
        descriptionLabel.text = descriptionText
        view.addSubview(descriptionLabel)
        
        view.addSubview(createAccountButton)
    }
    
    override func setupActions() {
        createAccountButton.addTarget(self, action: #selector(onCreateAccountButtonSelected(_:)), for: .touchUpInside)
    }
    @objc func onCreateAccountButtonSelected(_ button: UIButton) {
        signupCoordinator?.showCreateAccountVC()
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
        titleLabel.topAnchor.constraint(equalTo: logoIconImageView.bottomAnchor, constant: 110),
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        descriptionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
        createAccountButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 90),
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        createAccountButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        createAccountButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
}
