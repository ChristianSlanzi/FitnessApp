//
//  LoginTextField.swift
//  CleanArchitectureComposition
//
//  Created by Christian Slanzi on 13.12.19.
//  Copyright © 2019 Christian Slanzi. All rights reserved.
//

import UIKit

@IBDesignable
class LoginTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        //set a border
        self.layer.borderColor = UIColor(white: 231 / 255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
    
    //we add inset to have margin between text and border
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    //we apply the same inset when it is editing
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
