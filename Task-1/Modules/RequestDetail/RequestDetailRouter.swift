//
//  RequestDetailRouter.swift
//  Task-1
//
//  Created by Dinesh on 31/07/2019.
//  Copyright © 2019 Dinesh. All rights reserved.
//

import UIKit

class RequestDetailRouter {

    /// main router for using the prestent the app update onbording slide
    private var mainRouter: MainRouter?
    
    // MARK: - Life cycle methods
    
    /// initializer for preparing instance of a class services
    init(mainRouter: MainRouter? = nil) {
        
        self.mainRouter = mainRouter
    }
    
    /// assemble request detail slide
    func assembleScreen(in window: UIWindow) {
        
        guard let root = R.storyboard.requestDetail.instantiateInitialViewController() else {
            fatalError("Unable to get Request Detail ViewController.")
        }
        guard let vc = root.children.first as? RequestDetailViewController else {
            fatalError("Unable to get Request Detail ViewController.")
        }
        let interactor = RequestDetailInteractor(router: self)
        vc.interactor = interactor
        interactor.requestDetailVC = vc
        window.rootViewController = root
    }
}
