//
//  AvatarView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 19.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class AvatarView: CustomView {
    
    lazy var profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Profile")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(profileImageView)
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
        profileImageView.topAnchor.constraint(equalTo: topAnchor),
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor),
        profileImageView.widthAnchor.constraint(equalTo: heightAnchor),
        profileImageView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
