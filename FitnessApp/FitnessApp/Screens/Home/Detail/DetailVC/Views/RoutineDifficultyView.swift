//
//  RoutineDifficultyView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 16.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class RoutineDifficultyView: CustomView {
    
    lazy var iconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "HiLevelIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var valueLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#626363")
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.textAlignment = .left
        return titleLabel
    }()
   
    override func setupViews() {
        super.setupViews()
        addSubview(iconImageView)
        addSubview(valueLabel)
        
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28)
            //iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            valueLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 0),
            valueLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            valueLabel.heightAnchor.constraint(equalToConstant: 30)
            //iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
    }
}
