//
//  ContentView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 01.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI
import CS_CoreModule

protocol ContentViewProtocol {
    func getSelectedOption() -> ProfileQuestion?
}

class ContentView: CustomView {
    
    var profileQuestion: ProfileQuestion! {
        didSet {
            self.option1Button.setImage(UIImage(named: "\(profileQuestion.answers[0])Button"), for: .normal)
            self.option1Button.setImage(UIImage(named: "\(profileQuestion.answers[0])ButtonSelected"), for: .selected)
            self.option2Button.setImage(UIImage(named: "\(profileQuestion.answers[1])Button"), for: .normal)
            self.option2Button.setImage(UIImage(named: "\(profileQuestion.answers[1])ButtonSelected"), for: .selected)
            self.layoutIfNeeded()
        }
    }
    
    lazy var option1Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var option2Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        self.addSubview(option1Button)
        self.addSubview(option2Button)
        //first opsion selected by default
        //onButtonSelected(option1Button)

    }
    override func setupActions() {
        option1Button.addTarget(self, action: #selector(onButtonSelected(_:)), for: .touchUpInside)
        option2Button.addTarget(self, action: #selector(onButtonSelected(_:)), for: .touchUpInside)
    }
    @objc func onButtonSelected(_ button: UIButton) {
        option1Button.isSelected = false
        option2Button.isSelected = false
        button.isSelected = true
        
        //TODO
        //return selected option/answer upstairs. delegate or dispatch?
        
        //TODO : responder chain. we wend a message to our responder.
        UIApplication.shared.sendAction(#selector(AnswerAction.optionSelected(sender:)), to: nil, from: self, for: nil)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
        option1Button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        option1Button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        
        /*
        NSLayoutConstraint.activate([
        option1Button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        option1Button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
        option1Button.widthAnchor.constraint(equalToConstant: 152*2),
        option1Button.heightAnchor.constraint(equalToConstant: 162*2)
        ])
        */
        
        NSLayoutConstraint.activate([
        option2Button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        option2Button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        /*
        NSLayoutConstraint.activate([
        option2Button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        option2Button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        option2Button.widthAnchor.constraint(equalToConstant: 152*2),
        option2Button.heightAnchor.constraint(equalToConstant: 162*2)
        ])
 */
    }
}

extension ContentView: ContentViewProtocol {
    func getSelectedOption() -> ProfileQuestion? {
        //TODO: better do this right in the selection?
        if option1Button.isSelected {
            profileQuestion.selectedAnswer = profileQuestion.answers[0]
        } else {
            profileQuestion.selectedAnswer = profileQuestion.answers[1]
        }
        return profileQuestion
    }
}
