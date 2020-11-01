//
//  WorkoutRoutineDetailController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 31.10.20.
//

import CS_Common_UI

class WorkoutRoutineDetailController: BaseViewController {
    
    var routine: RoutineDTO
    var coordinator: StartingRoutine?
    //TODO: refactor in a navbarbaseviewcontroller that has a navigationbar already
    lazy var navigationBar: NavigationBar = {
        
        //TODO!!!! ModelView must be injected!!!
        var modelView = NavigationBarModelView(titleText: routine.title, subtitleText: "", imageName: nil)
    
        let view = NavigationBar(modelView: modelView)
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .systemBlue
        return view
        
    }()
    
    lazy var videoPreviewButton: UIImageView = {
        var button = UIImageView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.image=UIImage(named:routine.previewName)
        return button
    }()
    
    private lazy var startRoutineButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(hexFromString: "#9013fe")
        button.layer.cornerRadius = 30.0 // height/2
        button.setTitle("Start routine", for: .normal)
        //button.setUpButton()
        //button.configureColors(for: theme)
        return button
    }()
    
    lazy var routineDetailView: RoutineDetailView = {
        var view = RoutineDetailView(routine: self.routine)
        // view.backgroundColor = .yellow //DEBUG
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
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(hexString: "#F8F8F8")
        view.addSubview(navigationBar)
        view.addSubview(videoPreviewButton)
        view.addSubview(routineDetailView)
        view.addSubview(startRoutineButton)
    }
    
    override func setupActions() {
        startRoutineButton.addTarget(self, action: #selector(onStartRoutineButtonPressed), for: .touchUpInside)
    }
    
    @objc private func onStartRoutineButtonPressed() {
        coordinator?.startRoutineCountdown(with: routine)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            navigationBar.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            videoPreviewButton.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 0),
            //videoPreviewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //videoPreviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            videoPreviewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            videoPreviewButton.heightAnchor.constraint(equalToConstant: 228)
        ])
        
        NSLayoutConstraint.activate([
            routineDetailView.topAnchor.constraint(equalTo: videoPreviewButton.bottomAnchor, constant: 15),
            routineDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            routineDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            routineDetailView.bottomAnchor.constraint(equalTo: startRoutineButton.topAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
        startRoutineButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -20),
        startRoutineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        startRoutineButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
        startRoutineButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
