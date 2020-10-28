//
//  AppCoordinator.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 27.10.20.
//

import UIKit
import CS_CoreModule

final class AppCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    private let window: UIWindow
    
    init(window: UIWindow, navigation: UINavigationController) {
        self.window = window
        self.navigationController = navigation
        window.configure(with: navigation)
        navigation.configure()
    }

    convenience init(window: UIWindow = UIWindow()) {
        self.init(window: window, navigation: UINavigationController())
    }
    
    convenience init() {
        self.init(window: UIWindow(), navigation: UINavigationController())
    }

    func start() {
        let rootVC = LoadingViewController()
        rootVC.bgImageName = "Background"
        rootVC.coordinator = self
        navigationController.pushViewController(rootVC, animated: true)
    }
}

extension AppCoordinator: MovingToNextVC {
    func next() {
        let isOnboardingCompleted = AppSettingsManager.isOnboardingCompleted()
        if isOnboardingCompleted {
            // TODO: show login or main screen
        } else {
            // show onboarding
            let controller = OnBoardingViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            controller.onBoardingData = FitGoalDataManager.shared.getOnBoardingData()
            controller.coordinator = self
            navigationController.pushViewController(controller, animated: true)
        }
    }
}

// MARK: - UIWindow Extension
private extension UIWindow {
    func configure(with navigation: UINavigationController) {
        makeKeyAndVisible()
        rootViewController = navigation
    }
}

// MARK: - UINavigationController Extension
private extension UINavigationController {
    func configure() {
        navigationBar.isHidden = true
        interactivePopGestureRecognizer?.isEnabled = false
    }
}