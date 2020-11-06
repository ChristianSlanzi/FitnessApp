//
//  SettingsCoordinator.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 30.10.20.
//

import UIKit
import CS_CoreModule

class SettingsCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var started = false
    
    init(navigationController: UINavigationController, isNavigationBarHidden: Bool = true) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = isNavigationBarHidden
    }
    
    func start() {
        if started { return }
        
        let viewModel = SettingsViewModel()
        let controller =  SettingsViewController(settingsViewModel: viewModel)
        controller.bgImageName = "ScreenBackground"
        
        controller.tabBarItem = UITabBarItem(title: "screen_title_Settings".localized, image: UIImage(named: "Settings"), tag: 0)
        //navigationController.delegate = self
        navigationController.pushViewController(controller, animated: false)
        
        started = true
    }
}
