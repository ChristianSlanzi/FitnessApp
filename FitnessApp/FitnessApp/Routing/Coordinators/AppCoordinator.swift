//
//  AppCoordinator.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 27.10.20.
//

import UIKit
import CS_CoreModule
import CS_LoginModule

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
    
    func startMainTabBarController() {
        //TODO
    }
}

extension AppCoordinator: MovingToNextVC {
    func next() {
        let isOnboardingCompleted = AppSettingsManager.isOnboardingCompleted()
        if isOnboardingCompleted {
            // show login or main screen
            
            //TODO: import CS_LoginManager
            let isLoggedIn = LoginManager.getUserID() != nil
                
            if isLoggedIn {
                startMainTabBarController()
            } else {
                showLoginVC()
            }
        } else {
            // show onboarding
            let controller = OnBoardingViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            controller.onBoardingData = FitGoalDataManager.shared.getOnBoardingData()
            controller.coordinator = self
            navigationController.pushViewController(controller, animated: true)
        }
    }
}

extension AppCoordinator: CreatingAccount {
    func showLoginVC() {
        let controller = getLoginViewController()
        controller.signupCoordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showSignupVC() {
        let controller = SignupViewController()
        controller.bgImageName = "SignupBackground"
        controller.titleText = "HELLO!"
        controller.descriptionText = "Start transforming the way you enjoy your life"
        
        controller.signupCoordinator = self
        navigationController.pushViewController(controller, animated: true)//TODO
    }
    func showCreateAccountVC() {
        let controller = CreateAccountViewController()
        controller.bgImageName = "SignupBackground"

        controller.signupCoordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showProfileCreation() {
        //TODO
    }
    
    func showHomeVC() {
        startMainTabBarController()
    }
    
}

// MARK: Private
private extension AppCoordinator {
    private func getLoginViewController() -> LoginViewController {
        let loginViewController = LoginViewController()
        loginViewController.bgImageName = "SignupBackground"
        loginViewController.loginCoordinator = self
        return loginViewController
    }
    
}

// MARK: - LoginViewControllerCoordinator Delegate
extension AppCoordinator: LoginViewControllerCoordinatorDelegate {
    func userLoggedIn() {
        navigationController.popViewController(animated: true)
        
        startMainTabBarController()
    }
    
    //func didPressLoginButton() {
    //    navigation.popViewController(animated: true)
    //}
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
