//
//  RoutinePauseView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 23.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class RoutinePauseView: CustomView {
    
    var coordinator: StartingRoutine?
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#FFFFFF")
        titleLabel.font = .systemFont(ofSize: 34)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let restartButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true//false //TODO
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Restart"), for: .normal)
        button.addTarget(self, action: #selector(didTapRestartButton), for: .touchUpInside)
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true//false //TODO
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "PlayButton"), for: .normal)
        button.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
        return button
    }()
    
    private let quitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = UIColor(hexFromString: "#9013fe")
        //button.layer.cornerRadius = 30.0 // height/2
        button.setTitle("QUIT", for: .normal)
        button.addTarget(self, action: #selector(didTapQuitButton), for: .touchUpInside)
        //button.setUpButton()
        //button.configureColors(for: theme)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor(hexFromString: "#7335DC", alpha: 0.9)
        titleLabel.text = "PAUSED"
        addSubview(titleLabel)
        addSubview(restartButton)
        addSubview(playButton)
        addSubview(quitButton)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 202)
        ])
        
        NSLayoutConstraint.activate([
            restartButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            restartButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 85),
            restartButton.widthAnchor.constraint(equalToConstant: 70),
            restartButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -85),
            playButton.widthAnchor.constraint(equalToConstant: 70),
            playButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            quitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            quitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        ])
    }
    
    @objc private func didTapRestartButton() {
        //dismiss(animated: false)
        //coordinator?.restartRoutine()
    }
    
    @objc private func didTapPlayButton() {
        //dismiss(animated: false)
    }
    
    @objc private func didTapQuitButton() {
        coordinator?.stopRoutine()
        //dismiss(animated: false)
        //coordinator?.quitRoutine()
    }
}
