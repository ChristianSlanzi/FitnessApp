//
//  LoadingViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 27.10.20.
//

import UIKit
import CS_Common_UI
import CS_CoreModule

class LoadingViewController: BaseViewController {
    
    //coordinator
    public weak var coordinator: MovingToNextVC?
    
    lazy var activityIndicator: CustomIndicatorView = {
        let activityIndicator = CustomIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    // MARK: Init & Setup
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: implement a real data loader
        // loadData()
        // if dataLoadingIsComplete -> ask coordinator to push next view controller
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: {_ in
            self.coordinator?.next()
        })
    }
    
    override func setupViews() {
        super.setupViews()

        //TODO:
        //add logo
        
        //add title?
        
        //add loading indicator
        view.addSubview(activityIndicator)
        activityIndicator.showActivityIndicator()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        NSLayoutConstraint.activate([
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
