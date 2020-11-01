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
        let controller = WorkoutRoutineDetailController(routine: routine)
        controller.bgImageName = "ScreenBackground"
        controller.coordinator = self
        //injection of routine in the controller.. as initializer or as property

        //Keeping all the other attributes of the title: If you just want change the color you could do like this:
/*
        if var textAttributes = navigationController.navigationBar.titleTextAttributes {
            textAttributes[NSAttributedString.Key.foregroundColor] = UIColor.white
            navigationController.navigationBar.titleTextAttributes = textAttributes
        }*/
        
        //TODO: code should not be here.. refactor
        navigationController.isNavigationBarHidden = false
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        
        navigationController.pushViewController(controller, animated: false)
    }
}

extension MainCoordinator: StartingRoutine {
    func startRoutineCountdown(with routine: RoutineDTO) {
        let rootVC = CountdownViewController(routine: routine)
        rootVC.modalPresentationStyle = .fullScreen
        rootVC.bgImageName = "CountBackground"
        rootVC.coordinator = self
        navigationController.present(rootVC, animated: false, completion: {
            //
        })
    }
    
    func startRoutinePlay(with routine: RoutineDTO) {
        
    }
    
    func stopRoutine() {
        
    }
    
    func completeRoutine() {
        
    }
}
