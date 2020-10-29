//
//  LoginVcFactory.swift
//  Fitness-Notiz
//
//  Created by Christian Slanzi on 16.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import Foundation

//TODO: refactor all factories with a generic T
public class LoginVcFactory: BaseVcFactory {
    
    let viewControllerIdentifier = "LoginViewController"
    
    public override init() {
        super.init()
    }
    
    public func create() -> LoginViewController? {
        mainStoryboardIdentifier = "Login" 
        var viewController: LoginViewController?
        if #available(iOS 13.0, *) {
            viewController = storyboard.instantiateViewController(identifier: viewControllerIdentifier) as LoginViewController
        } else {
               // Fallback on earlier versions
               viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as? LoginViewController
        }
        return viewController
    }
}
