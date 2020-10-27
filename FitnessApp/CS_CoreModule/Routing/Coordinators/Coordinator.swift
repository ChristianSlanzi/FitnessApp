//
//  Coordinator.swift
//  CS_CoreModule
//
//  Created by Christian Slanzi on 27.10.20.
//

import UIKit

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
