//
//  PictureInfoView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 19.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class PictureInfoView: CustomView {
    
    private let avatarView: AvatarView = {
        var view = AvatarView()
//        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(hexString: "#FFFFFF")
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textAlignment = .left
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let levelLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(hexString: "#FFFFFF")
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        //lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        return lbl
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(avatarView)
        addSubview(usernameLabel)
        addSubview(levelLabel)
        
        //TODO: inject user profile or view model.
        usernameLabel.text = "NAHO JOBS"
        levelLabel.text = "Beginner"
        
    }
    
    public func setName(name: String) {
        usernameLabel.text = name
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            avatarView.leftAnchor.constraint(equalTo: leftAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 104),
            avatarView.heightAnchor.constraint(equalToConstant: 104)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 8),
            usernameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            usernameLabel.heightAnchor.constraint(equalToConstant: 48),
            usernameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            levelLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 8),
            //           setsLabel.widthAnchor.constraint(equalToConstant: 70),
            levelLabel.heightAnchor.constraint(equalToConstant: 48),
            levelLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
}
