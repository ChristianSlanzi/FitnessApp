//
//  MyGoalViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 31.10.20.
//

import CS_Common_UI

class MyGoalViewController: BaseViewController {
    
    var viewModel: MyGoalViewModel
    
    //TODO: refactor in a navbarbaseviewcontroller that has a navigationbar already
    lazy var navigationBar: NavigationBar = {
        let view = NavigationBar(modelView: viewModel.getNavigationBarViewModel())
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .systemBlue
        return view
    }()
    
    // MARK: Init & Setup
    init(viewModel: MyGoalViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(navigationBar)

    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            navigationBar.heightAnchor.constraint(equalToConstant: 140)
        ])
        
    }
    
}
