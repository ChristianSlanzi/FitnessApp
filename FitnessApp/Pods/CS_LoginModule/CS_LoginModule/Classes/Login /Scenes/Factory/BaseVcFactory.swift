//
//  BaseVcFactory.swift
//  Fitness-Notiz
//
//  Created by Christian Slanzi on 28.10.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import Foundation
import UIKit

public class BaseVcFactory {
    public var mainStoryboardIdentifier = "Main"
    
    lazy var storyboard: UIStoryboard = { return UIStoryboard(name: self.mainStoryboardIdentifier, bundle: Bundle(for: type(of: self)))
    }()
}
