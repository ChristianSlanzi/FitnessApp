//
//  ExploreCoordinator.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 30.10.20.
//

import UIKit
import CS_CoreModule
import CS_Common_UI

class ExploreCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var started = false
    
    init(navigationController: UINavigationController, isNavigationBarHidden: Bool = true) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = isNavigationBarHidden
    }
    
    func start() {
        if started { return }
        
        let navbarModel = NavigationBarModelView(titleText: "EXPLORE", subtitleText: "", imageName: nil)
        
        let viewModel = ExploreViewModel(dataManager: AppDataManager.shared,
                                      navigationBarViewModel: navbarModel)
        
        let controller =  ExploreViewController(viewModel: viewModel)
        controller.bgImageName = "ScreenBackground"

        controller.tabBarItem = UITabBarItem(title: "screen_title_Explore".localized, image: UIImage(named: "Explore"), tag: 0)
        //navigationController.delegate = self
        navigationController.pushViewController(controller, animated: false)
        
        started = true
    }
}
