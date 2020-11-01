//
//  CountdownViewController.swift
//  FitGoal
//
//  Created by Christian Slanzi on 20.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class CountdownViewController: BaseViewController {
    
    var routine: RoutineDTO
    var coordinator: StartingRoutine?
    
    private lazy var countdown = Countdown(startTime: 3, timeUpdated: { [weak self] timeInterval in
        guard let strongSelf = self else { return }
        
        if timeInterval <= 0 {
            //Send alert to indicate "time's up!"
            strongSelf.dismiss(animated: false)
            strongSelf.coordinator?.startRoutinePlay(with: strongSelf.routine)
            return
        }
        
        strongSelf.countdownLabel.text = String(format: "%d", Int(timeInterval))
        switch timeInterval {
        case 3:
            strongSelf.statusLabel.text = "Ready!"
        case 2:
            strongSelf.statusLabel.text = "You can do it!"
        case 1:
            strongSelf.statusLabel.text = "Let's start!"
        default:
            break
        }
        
    })
    
    private let countdownLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(hexString: "#FFFFFF")
        lbl.font = UIFont.systemFont(ofSize: 181)
        lbl.textAlignment = .left
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let statusLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#FFFFFF")
        titleLabel.font = .systemFont(ofSize: 35)
        titleLabel.textAlignment = .right
        return titleLabel
    }()
    
    // MARK: Init & Setup
    init(routine: RoutineDTO) {
        self.routine = routine
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startCountdown()
    }
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(countdownLabel)
        view.addSubview(statusLabel)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            countdownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countdownLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -90)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: countdownLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func startCountdown() {
        countdown.toggle()
    }
    
}
