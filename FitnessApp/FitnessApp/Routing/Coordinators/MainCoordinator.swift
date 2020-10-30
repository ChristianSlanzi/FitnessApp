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
        
    }
    
    
}
