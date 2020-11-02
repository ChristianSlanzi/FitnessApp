//
//  RoutinePlayViewController.swift
//  FitGoal
//
//  Created by Christian Slanzi on 20.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class RoutinePlayViewController: BaseViewController {
    
    var routine: RoutineDTO
    var coordinator: StartingRoutine?
    
    private lazy var videoPreviewButton: VideoPreviewButton = {
        var button = VideoPreviewButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(routine.previewName)//, for: .normal)
        return button
    }()
    
    private lazy var routinePlayInfoView: RoutinePlayInfoView = {
        var view = RoutinePlayInfoView(routine: routine, coordinator: coordinator)
    //      view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = UIColor(hexFromString: "#9013fe")
        //button.layer.cornerRadius = 30.0 // height/2
        button.setTitle("STOP", for: .normal)
        button.addTarget(self, action: #selector(didTapStopButton), for: .touchUpInside)
        //button.setUpButton()
        //button.configureColors(for: theme)
        return button
    }()
    
    private let routinePauseView: RoutinePauseView = {
        var view = RoutinePauseView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        
        //TODO: handle routine cicle: routine started, exercise completed, next exercise, all exercises completed, routine completed
        // routine paused, routine continue, routine restart.
        
    }
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(videoPreviewButton)
        view.addSubview(routinePlayInfoView)
        view.addSubview(stopButton)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            videoPreviewButton.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 65),
            //videoPreviewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //videoPreviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            videoPreviewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            videoPreviewButton.heightAnchor.constraint(equalToConstant: 228)
        ])
        
        NSLayoutConstraint.activate([
            routinePlayInfoView.topAnchor.constraint(equalTo: videoPreviewButton.bottomAnchor, constant: 15),
            routinePlayInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            routinePlayInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            routinePlayInfoView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -120)
        ])
        
        NSLayoutConstraint.activate([
        stopButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -20),
        stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stopButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        stopButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func didTapStopButton() {
        //dismiss(animated: false)
        //coordinator?.stopRoutine()
        pauseCountdown()
        routinePauseView.coordinator = coordinator
        view.addSubview(routinePauseView)
        NSLayoutConstraint.activate([
            routinePauseView.topAnchor.constraint(equalTo: view.topAnchor),
            routinePauseView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            routinePauseView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            routinePauseView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func pauseCountdown() {
        routinePlayInfoView.toggleCountdown()
        videoPreviewButton.pause()
    }
    
    private func startCountdown() {
        routinePlayInfoView.toggleCountdown()
        videoPreviewButton.play()
    }
}
