//
//  ShareOptionsView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 21.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class ShareOptionsView: CustomView {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#FFFFFF")
        titleLabel.font = .systemFont(ofSize: 19)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let facebookButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true//false //TODO
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Facebook"), for: .normal)
        button.addTarget(self, action: #selector(didTapFacebookButton), for: .touchUpInside)
        return button
    }()
    
    private let twitterButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true//false //TODO
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Twitter"), for: .normal)
        button.addTarget(self, action: #selector(didTapTwitterButton), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(titleLabel)
        addSubview(facebookButton)
        addSubview(twitterButton)
        
        titleLabel.text = "Share your experience"
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            facebookButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            facebookButton.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            facebookButton.widthAnchor.constraint(equalToConstant: 70),
            facebookButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            twitterButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            twitterButton.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            twitterButton.widthAnchor.constraint(equalToConstant: 70),
            twitterButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
    }
    
    @objc private func didTapFacebookButton() {
        
    }
    
    @objc private func didTapTwitterButton() {
        
    }
}
