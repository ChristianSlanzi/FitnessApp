//
//  SettingsViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 31.10.20.
//

import CS_Common_UI

class SettingsViewController: BaseViewController {
    
    //TODO: refactor in a navbarbaseviewcontroller that has a navigationbar already
    lazy var navigationBar: NavigationBar = {
        
        //TODO!!!! ModelView must be injected!!!
        var modelView = NavigationBarModelView(titleText: "SETTINGS", subtitleText: "", imageName: nil)
        
        let view = NavigationBar(modelView: modelView)
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .systemBlue
        return view
        
    }()
    
    lazy var pictureInfoView: PictureInfoView = {
        var view = PictureInfoView()
//                view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var settingsContentView: SettingsContentView = {
        var view = SettingsContentView()
//                view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var settingsViewModel: SettingsViewModel? = nil {
        didSet {
            //TODO: inject settings in the view controller
            //var items = [Settings]()
            //items.append(Settings(iconName: "heightIcon", title: "Height", value: "5' 9\""))
            //items.append(Settings(iconName: "weightIcon", title: "Weight", value: "159 LB"))
            //items.append(Settings(iconName: "genderIcon", title: "Gender", value: "Female"))
            //items.append(Settings(iconName: "calendarIcon", title: "Age", value: "28"))
            
            guard let settingsViewModel = settingsViewModel else { return }
            settingsViewModel.getData()
            
            var items = [Settings]()
            items.append(Settings(iconName: "heightIcon", title: "Height", value: settingsViewModel.heightText))
            items.append(Settings(iconName: "weightIcon", title: "Weight", value: settingsViewModel.weightText))
            items.append(Settings(iconName: "genderIcon", title: "Gender", value: settingsViewModel.genderText))
            items.append(Settings(iconName: "calendarIcon", title: "Age", value: settingsViewModel.ageText))
            
            settingsContentView.items = items
            
            //TODO: pictureInfoView viewmodel? it's getting chaotic..
            pictureInfoView.setName(name: settingsViewModel.nameText)
        }
    }
    
    // MARK: Init & Setup
    public init(settingsViewModel: SettingsViewModel) {
        super.init()
        setup(model: settingsViewModel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(model: SettingsViewModel) {
        self.settingsViewModel = model
    }
    
    override func setupViews() {
        super.setupViews()
        //settingsViewModel?.getData()
        view.addSubview(navigationBar)
        view.addSubview(pictureInfoView)
        view.addSubview(settingsContentView)

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
            pictureInfoView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 0),
            pictureInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pictureInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pictureInfoView.heightAnchor.constraint(equalToConstant: 104)
        ])
        
        NSLayoutConstraint.activate([
            settingsContentView.topAnchor.constraint(equalTo: pictureInfoView.bottomAnchor, constant: 0),
            settingsContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            settingsContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            settingsContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
