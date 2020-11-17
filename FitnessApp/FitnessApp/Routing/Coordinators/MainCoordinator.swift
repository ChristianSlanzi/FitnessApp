//
//  MainCoordinator.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 30.10.20.
//

import CS_Common_Utils
import CS_Common_UI
import CS_CoreModule

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var started = false
    
    init(navigationController: UINavigationController, isNavigationBarHidden: Bool = true) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = isNavigationBarHidden
    }
    
    func start() {
        if started { return }
        
        let navbarModel = NavigationBarModelView(titleText: RemoteConfigManager.shared.getValueForKey(.homeText) as? String,//"MY\nGOAL",
                                                 subtitleText: "February",
                                                 imageName: "Profile")
        
        let contentModel = ContainerControllerModel(navigationItemTitle: "MY GOAL",
                                                    collectionRowHeight: 219,
                                                    tableRowHeight: 136,
                                                    sectionTitles: ["ROUTINE", "SUGGESTED"],
                                                    sectionTitleHexColor: "#626363",
                                                    sectionMoreButtonTitles: ["", "See all"],
                                                    sectionMoreButtonTitleHexColor: "#3EC7E6"
                                                    )
        
        let viewModel = HomeViewModel(dataManager: AppDataManager.shared,
                                      navigationBarViewModel: navbarModel,
                                      contentViewModel: contentModel)
        
        let controller = HomeViewController(viewModel: viewModel) //TODO: inject the datamanager?
        controller.bgImageName = "ScreenBackground"
        controller.tabBarItem = UITabBarItem(title: "screen_title_Home".localized, image: UIImage(named: "Home"), tag: 0)
        controller.coordinator = self
        
        navigationController.pushViewController(controller, animated: false)
        
        started = true
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
        let rootVC = RoutinePlayViewController(routine: routine)
        rootVC.modalPresentationStyle = .fullScreen
        rootVC.bgImageName = "CountBackground"
        rootVC.coordinator = self
        navigationController.present(rootVC, animated: false, completion: {
            // TODO
        })
    }
    
    func stopRoutine() {
        //doesnt work
        //navigationController.getTopMostViewController()?.presentedViewController?.dismiss(animated: true)
        
        //TODO: this dismiss also the view controller that presented the modals
        navigationController.getTopMostViewController()?.dismiss(animated: true)
    }
    
    func completeRoutine() {
        let rootVC = RoutineCompleteViewController()
        rootVC.modalPresentationStyle = .fullScreen
        rootVC.bgImageName = "CountBackground"
        rootVC.coordinator = self
        navigationController.present(rootVC, animated: false, completion: {
            // TODO
        })
    }
}
