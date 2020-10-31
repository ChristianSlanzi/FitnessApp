//
//  ExploreCoordinator.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 30.10.20.
//

import UIKit
import CS_CoreModule

class ExploreCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, isNavigationBarHidden: Bool = true) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = isNavigationBarHidden
    }
    
    func start() {
        let controller =  ExploreViewController()
        controller.bgImageName = "ScreenBackground"

        controller.tabBarItem = UITabBarItem(title: "screen_title_Explore".localized, image: UIImage(named: "Explore"), tag: 0)
        //navigationController.delegate = self
        navigationController.pushViewController(controller, animated: false)
    }
}
