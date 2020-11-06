//
//  MainTabBarCoordinatedController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 30.10.20.
//

import UIKit
import CS_CoreModule

class MainTabBarCoordinatedController: UITabBarController, UITabBarControllerDelegate {
    
    let theme = SettingsService.shared.appTheme
    var coordinators: [Coordinator] = []
    
    public convenience init(coordinators: [Coordinator]) {
        self.init()
        self.coordinators = coordinators
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startCoordinators()
        
        self.tabBar.updateColors(for: theme)
    }
    
    private func startCoordinators() {
        
        
        for coordinator in coordinators {
            coordinator.start()
            coordinator.navigationController.navigationBar.updateColors(for: theme)
        }
        // Do any additional setup after loading the view.
        viewControllers = self.coordinators.map({ $0.navigationController
        })
        
        
    }
    
    //TODO: find better solution
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        for controller in viewControllers! {
            if let controller = controller as? UINavigationController {
                if controller != viewController.navigationController {
                    controller.popToRootViewController(animated: true)
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
