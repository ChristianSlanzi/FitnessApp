//
//  MainCoordinator.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 30.10.20.
//

import UIKit
import CS_CoreModule

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, isNavigationBarHidden: Bool = true) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = isNavigationBarHidden
    }
    
    func start() {
        let controller = HomeViewController(dataManager: AppDataManager.shared) //TODO: inject the datamanager?
        controller.bgImageName = "ScreenBackground"
        controller.coordinator = self
        
        controller.tabBarItem = UITabBarItem(title: "screen_title_Home".localized, image: UIImage(named: "Home"), tag: 0)
        navigationController.pushViewController(controller, animated: false)
    }
}

extension MainCoordinator: ShowingRoutineDetail {
    func showRoutineDetail(with routine: RoutineDTO) {
        //TODO
    }
}
