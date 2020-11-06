//
//  SettingsCoordinator.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 30.10.20.
//

import UIKit
import CS_CoreModule
import CS_Common_UI

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
        
        let navbarModel = NavigationBarModelView(titleText: "SETTINGS", subtitleText: "", imageName: nil)
        let viewModel = SettingsViewModel(navigationBarViewModel: navbarModel)
        let controller =  SettingsViewController(settingsViewModel: viewModel)
        controller.bgImageName = "ScreenBackground"
        
        controller.tabBarItem = UITabBarItem(title: "screen_title_Settings".localized, image: UIImage(named: "Settings"), tag: 0)
        //navigationController.delegate = self
        navigationController.pushViewController(controller, animated: false)
        
        started = true
    }
}
