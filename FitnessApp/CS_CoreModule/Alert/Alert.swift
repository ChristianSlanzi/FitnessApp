//
//  Alert.swift
//  CS_CoreModule
//
//  Created by Christian Slanzi on 29.10.20.
//

import UIKit

public struct Alert {
    static public func present(title: String?, message: String, actions: Alert.Action..., from controller: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alertController.addAction(action.alertAction)
        }
        controller.present(alertController, animated: true, completion: nil)
    }
}

public extension Alert {
    enum Action {
        case okay(handler: (() -> Void)?)
        case retry(handler: (() -> Void)?)
        case close

        // Returns the title of our action button
        private var title: String {
            switch self {
            case .okay:
                return "alert_button_ok".localizedInCoreModule
            case .retry:
                return "alert_button_retry".localizedInCoreModule
            case .close:
                return "alert_button_close".localizedInCoreModule
            }
        }

        // Returns the completion handler of our button
        private var handler: (() -> Void)? {
            switch self {
            case .okay(let handler):
                return handler
            case .retry(let handler):
                return handler
            case .close:
                return nil
            }
        }

        var alertAction: UIAlertAction {
            return UIAlertAction(title: title, style: .default, handler: { _ in
                if let handler = self.handler {
                    handler()
                }
            })
        }
    }
}

//ALERT WITH TEXT
public struct AlertWithInputText {
    public static func present(title: String?, message: String, from controller: UIViewController, completion: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // ADD ACTIONS HANDLER
        let cancelAction = UIAlertAction(title: "action_cancel_title".localizedInCoreModule, style: .cancel)
        cancelAction.isEnabled = true
        alertController.addAction(cancelAction)

        let continueAction = UIAlertAction(title: "action_save_title".localizedInCoreModule, style: .default) { (_) in
            let serialNumberField = alertController.textFields![0] as UITextField
            let text = serialNumberField.text
            completion(text ?? "")
        }
        continueAction.isEnabled = false
        alertController.addAction(continueAction)

        // ADD TEXT FIELDS
        alertController.addTextField { (textField) in
            textField.placeholder = ""
            // enable continue button when serial not empty
            textField.clearButtonMode = UITextField.ViewMode.always
            
            let notifName = UITextField.textDidChangeNotification
            NotificationCenter.default.addObserver(forName: notifName, object: textField, queue: OperationQueue.main) { (notification) in
                continueAction.isEnabled = textField.text != ""// && textField.text?.count > 3
            }
        }

        //alertController.view.tintColor = Colors.mainColor
        controller.present(alertController, animated: true)
    }
}

//ALERT WITH TEXT
public class AlertWithInputTextAndCheckbox {
    var imageButton: UIButton! = nil
    
    public init() {}
    
    public func present(title: String?, message: String, from controller: UIViewController, completion: @escaping (String, Bool) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // ADD ACTIONS HANDLER
        let cancelAction = UIAlertAction(title: "action_cancel_title".localizedInCoreModule, style: .cancel)
        cancelAction.isEnabled = true
        alertController.addAction(cancelAction)

        let continueAction = UIAlertAction(title: "action_save_title".localizedInCoreModule, style: .default) { (_) in
            let serialNumberField = alertController.textFields![0] as UITextField
            let text = serialNumberField.text
            let isSelected = self.imageButton.isSelected
            completion(text ?? "", isSelected)
        }
        continueAction.isEnabled = false
        alertController.addAction(continueAction)

        // ADD TEXT FIELDS
        alertController.addTextField { (textField) in
            textField.placeholder = ""
            // enable continue button when serial not empty
            textField.clearButtonMode = UITextField.ViewMode.always
            
            let notifName = UITextField.textDidChangeNotification
            NotificationCenter.default.addObserver(forName: notifName, object: textField, queue: OperationQueue.main) { (notification) in
                continueAction.isEnabled = textField.text != ""// && textField.text?.count > 3
            }
        }
        
        //show it
        let btnImage = UIImage(named: "checkBox")!
        imageButton = UIButton(frame: CGRect(x: 220, y: 40, width: 25, height: 25))
        imageButton.setBackgroundImage(btnImage, for: UIControl.State())
        imageButton.addTarget(self, action: #selector(AlertWithInputTextAndCheckbox.checkBoxAction(_:)), for: .touchUpInside)
        alertController.view.addSubview(imageButton)

        //alertController.view.tintColor = Colors.mainColor
        controller.present(alertController, animated: true)
    }
    
    @objc func checkBoxAction(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            let btnImage    = UIImage(named: "checkBox")!
            sender.setBackgroundImage(btnImage, for: UIControl.State())
        } else {
            sender.isSelected = true
            let btnImage    = UIImage(named: "unCheckBox")!
            sender.setBackgroundImage(btnImage, for: UIControl.State())
        }
    }
}
