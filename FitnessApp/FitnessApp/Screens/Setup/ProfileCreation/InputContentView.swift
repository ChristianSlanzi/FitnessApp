//
//  InputContentView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 06.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI
import CS_CoreModule

class InputContentView: CustomView {
    
    var profileQuestion: ProfileQuestion! {
        didSet {
            self.inputTextField.text = profileQuestion.answers[0]
            self.layoutIfNeeded()
        }
    }
    
    lazy var card: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 52)
        textField.textColor = .gray
        return textField
    }()
    
    convenience init(profileQuestion: ProfileQuestion) {
        self.init()
        setProfileQuestion(newValue: profileQuestion)
    }
    
    func setProfileQuestion(newValue: ProfileQuestion) {
        self.profileQuestion = newValue
    }
    
    override func setupViews() {
        super.setupViews()
        self.addSubview(card)
        self.addSubview(inputTextField)
    }
    override func setupActions() {

    }

    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
        card.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        card.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        card.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        card.heightAnchor.constraint(equalToConstant: 162)
        ])
        
        NSLayoutConstraint.activate([
        inputTextField.centerYAnchor.constraint(equalTo: card.centerYAnchor),
        inputTextField.centerXAnchor.constraint(equalTo: card.centerXAnchor)
        ])
        
    }
}

extension InputContentView: ContentViewProtocol {
    func getSelectedOption() -> ProfileQuestion? {
        profileQuestion.selectedAnswer = inputTextField.text
        return profileQuestion
    }
}
