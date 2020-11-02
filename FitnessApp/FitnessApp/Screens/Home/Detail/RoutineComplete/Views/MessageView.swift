//
//  MessageView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 21.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class MessageView: CustomView {
    
    private let subTitleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#FFFFFF")
        titleLabel.font = .systemFont(ofSize: 35)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#FFFFFF")
        titleLabel.font = .systemFont(ofSize: 49)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#FFFFFF")
        titleLabel.font = .systemFont(ofSize: 19)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        return titleLabel
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(subTitleLabel)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        //TODO: inject
        subTitleLabel.text = "Excellent!"
        titleLabel.text = "YOU ROCK!"
        descriptionLabel.text = "You finished your routine.\nHow do you feel?\nThe next time will be easier!"
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            subTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30)
        ])
    }
}
