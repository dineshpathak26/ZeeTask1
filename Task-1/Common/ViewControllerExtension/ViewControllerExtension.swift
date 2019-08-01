//
//  ViewControllerExtension.swift
//  Task-1
//
//  Created by Dinesh on 31/07/2019.
//  Copyright © 2019 Dinesh. All rights reserved.
//

import UIKit

/// UIViewController extension for set the UIViewController alert and there actions
extension UIViewController {
    
    // MARK: - Alert Methods
    
    
    /// Method to show native alert
    ///
    /// - Parameters:
    ///   - title: title of Alert
    ///   - message: description of the Alert
    ///   - buttonTitles: Array of buttons
    ///   - customAlertViewTapButtonBlock: returns completion handler
    ///   - isHighPriority: Its a unique parameter that dismiss any alert or view presenting
    ///     over the current view controller. Only to be used for high priority alerts.
    func showAlert(forTitle title: String = "",
                   message: String,
                   buttonTitles: [String],
                   customAlertViewTapButtonBlock: ((Int) -> Void)?, isHighPriority: Bool = false) {
        DispatchQueue.main.async { [weak self] in
            var actions = [UIAlertAction]()
            for buttonIndex in 0..<(buttonTitles.count) {
                let alertAction = UIAlertAction(title: buttonTitles[buttonIndex],
                                                style: UIAlertAction.Style.default,
                                                handler: { _ in
                                                    customAlertViewTapButtonBlock?(buttonIndex)
                })
                actions.append(alertAction)
            }
            if isHighPriority {
                guard let presentedVC = self?.presentedViewController else {
                    self?.showAlert(forTitle: title, message: message, actions: actions)
                    return
                }
                presentedVC.dismiss(animated: true, completion: {
                    self?.showAlert(forTitle: title, message: message, actions: actions)
                })
            } else {
                self?.showAlert(forTitle: title, message: message, actions: actions)
            }
        }
    }
    
    
    // MARK: - Alert Methods
    
    private func showAlert(forTitle title: String = "", message: String, actions: [UIAlertAction]) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        actions.forEach { alertController.addAction($0) }
        alertController.modalPresentationStyle = .custom
        alertController.modalTransitionStyle = .crossDissolve
        present(alertController, animated: true, completion: nil)
    }
    
}


extension UIAlertController{
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.tintColor = .black
    }
}

