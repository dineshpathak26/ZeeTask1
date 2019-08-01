//
//  MainRouter.swift
//  Task-1
//
//  Created by Dinesh on 31/07/2019.
//  Copyright © 2019 Dinesh. All rights reserved.
//

import UIKit

/// Implementation of MainRouting
class MainRouter {
    
    ///
    private let launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ///
    private let window: UIWindow
    ///
    private var rootVC: UIViewController? {
        return window.rootViewController
    }
    
    /**
     Initialize the router with required dependencies
     
     - parameter window: The root window of the application
     */
    init(window: UIWindow, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        
        self.window = window
        self.launchOptions = launchOptions
    }
    
    /**
     Call to determine and present the root view for this application.
     Currently that will be either the tabBar or the initial onboarding slideshow.
     */
    func presentInitialViewController() {
        
        // check app is updated version or not
        let requestDetailRouter = RequestDetailRouter(mainRouter: self)
        requestDetailRouter.assembleScreen(in: window)
    }
}
