//
//  HeaderView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 01.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI
import CS_CoreModule

class HeaderView: CustomView {
    
    var profileQuestion: ProfileQuestion! {
        didSet {
            self.smallTitleLabel.text = profileQuestion.smallTitleText
            self.bigTitleLabel.text = profileQuestion.bigTitleText
            self.layoutIfNeeded()
        }
    }
    
   lazy var smallTitleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 19)
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    lazy var bigTitleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 49)
        titleLabel.textAlignment = .left
        return titleLabel
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
        self.addSubview(smallTitleLabel)
        self.addSubview(bigTitleLabel)
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
        smallTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
        smallTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
        bigTitleLabel.topAnchor.constraint(equalTo: smallTitleLabel.bottomAnchor, constant: 0),
        bigTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
}
