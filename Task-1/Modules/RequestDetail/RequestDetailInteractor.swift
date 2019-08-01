//
//  RequestDetailInteractor.swift
//  Task-1
//
//  Created by Dinesh on 31/07/2019.
//  Copyright © 2019 Dinesh. All rights reserved.
//

import UIKit

/// product delivery status
enum productStatusEnum {
    
    // product Dispatched
    case dispatched
    // product Arrived
    case arrived
    // product Work in Progress
    case workInProgress
    // product Completed
    case completed
    // product Cancel Work
    case cancelWork
}

/// implementation of Interacting for the Request Detail Slide
class RequestDetailInteractor: Interacting {

    /// RequestDetail slide router
    weak var requestDetailRouter: RequestDetailRouter?
    /// RequestDetail Slide ViewController
    weak var requestDetailVC: RequestDetailViewController?
    /// define phone number for call
    private let mobileNumber = "1234567890"
    // MARK: - Life Cycle Methods
    
    /**
     Initialize the router with required dependencies
     
     */
    init(router: RequestDetailRouter) {
        
        self.requestDetailRouter = router
    }
    
    // update the product status and call the API and if any logic we want to do then we will do in this block
    func UpdateproductState(withType state: productStatusEnum) {
        
        switch state {
        case .dispatched:
            // update the UI of dispatch status
            requestDetailVC?.updateUIForProductStatus(state: productStatusEnum.dispatched)
        case .arrived:
            // update the UI of arrived status
            requestDetailVC?.updateUIForProductStatus(state: productStatusEnum.arrived)
        case .workInProgress:
            // update the UI of work in Progress status
            requestDetailVC?.updateUIForProductStatus(state: productStatusEnum.workInProgress)
        case .completed:
            // update the UI of completed status
            requestDetailVC?.updateUIForProductStatus(state: productStatusEnum.completed)
        default:
            // update the UI of cancel work status
            requestDetailVC?.updateUIForProductStatus(state: productStatusEnum.cancelWork)
        }
    }
    
    // make the phone call 
    func makePhoneCall()  {
        
        guard let url: NSURL = URL(string: "TEL://\(mobileNumber)") as NSURL? else { return }
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
}
