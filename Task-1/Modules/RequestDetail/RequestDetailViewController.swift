//
//  RequestDetailViewController.swift
//  Task-1
//
//  Created by Dinesh on 31/07/2019.
//  Copyright © 2019 Dinesh. All rights reserved.
//

import UIKit

class RequestDetailViewController: BaseViewController<RequestDetailInteractor> {
    
    // MARK: - IBOutlet
    
    /// userDetail view outlet
    @IBOutlet weak var userDetailView: UIView!
    /// detail view button outlet
    @IBOutlet weak var viewDetailButton: UIButton!
    /// Team user profile image outlet
    @IBOutlet weak var userImageView: UIImageView!
    /// Team user profile image outlet
    @IBOutlet weak var secondUserImageView: UIImageView!
    /// product status view outlet
    @IBOutlet weak var productStatus: UIView!
    /// bottom option view outlet
    @IBOutlet weak var optionView: UIView!
    /// chat button outlet
    @IBOutlet weak var chatButton: UIButton!
    /// call button outlet
    @IBOutlet weak var callButton: UIButton!
    /// update product status button outlet
    @IBOutlet weak var updateStatusButton: UIButton!
    /// update status width constraint
    @IBOutlet weak var updateStatusWidthConstraint: NSLayoutConstraint!
    /// dispatch circle ImageView
    @IBOutlet weak var dispatchImageView: UIImageView!
    /// arrived circle ImageView
    @IBOutlet weak var arrivedImageView: UIImageView!
    /// work in progress circle ImageView
    @IBOutlet weak var workInProgressImageView: UIImageView!
    /// completed circle ImageView
    @IBOutlet weak var completedImageView: UIImageView!
    
    // MARK: - IBAction
    
    // Product Detail button tap action
    @IBAction func productViewDetailButtonTap(_ sender: Any) {
        
        showAlert(message: R.string.localizable.comingSoon(), buttonTitles: [R.string.localizable.okay()], customAlertViewTapButtonBlock: nil)
    }
    
    // phone call button tap action
    @IBAction func callButtonTap(_ sender: Any) {
        
        #if targetEnvironment(simulator)
        showAlert(message: R.string.localizable.callIsNotSupported(), buttonTitles: [R.string.localizable.okay()], customAlertViewTapButtonBlock: nil)
        #else
        interactor?.makePhoneCall()
        #endif
    }
    
    // chat button tap action
    @IBAction func chatButtonTap(_ sender: Any) {
        
        showAlert(message: R.string.localizable.comingSoon(), buttonTitles: [R.string.localizable.okay()], customAlertViewTapButtonBlock: nil)
    }
    
    // product status update button tap action
    @IBAction func updateStatusButtonTap(_ sender: Any) {
        
        displayActionSheetForStatusUpdate()
    }
    
    // MARK: - Life Cycle Methods
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Setup
    
    // setup the UI
    func setupUI() {
        
        userDetailView.setBottomShadow(4.0)
        viewDetailButton.setCornerRadiusWithBorder()
        productStatus.setBottomShadow(6.0)
        userImageView.roundCorner()
        optionView.setTopShadow()
        chatButton.setCornerRadiusWithBorder(UIColor.borderColor.cgColor, 22.0, 1.0)
        callButton.setCornerRadiusWithBorder(UIColor.borderColor.cgColor, 22.0, 1.0)
        updateStatusButton.setCornerRadiusWithBorder(UIColor.borderColor.cgColor, 22.0, 1.0)
        if CommonConstant.isiPhone5 {
            updateStatusWidthConstraint.constant = 100
        } else if CommonConstant.isiPhone6 {
            updateStatusWidthConstraint.constant = 120
        } else if CommonConstant.isiPhoneX {
            updateStatusWidthConstraint.constant = 140
        }
    }
    
    
    /// show the action sheet with there options
    func displayActionSheetForStatusUpdate() {
        
        // 1 define the UIAlertController and his title and message
        let shipmentOptionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 2 define the UIAlertAction for shipment
        let dispatchAction = UIAlertAction(title: R.string.localizable.dispatched(), style: .default, handler: { (action) -> Void in
            self.interactor?.UpdateproductState(withType: productStatusEnum.dispatched)
        })
        let arriveAction = UIAlertAction(title: R.string.localizable.arrived(), style: .default, handler: { (action) -> Void in
            self.interactor?.UpdateproductState(withType: productStatusEnum.arrived)
        })
        let workInProgressAction = UIAlertAction(title: R.string.localizable.workInProgress(), style: .default, handler: { (action) -> Void in
            self.interactor?.UpdateproductState(withType: productStatusEnum.workInProgress)
        })
        let completAction = UIAlertAction(title: R.string.localizable.completed(), style: .default, handler: { (action) -> Void in
            self.interactor?.UpdateproductState(withType: productStatusEnum.completed)
        })
        let cancelAction = UIAlertAction(title: R.string.localizable.cancelWork(), style: .destructive, handler: { (action) -> Void in
            self.interactor?.UpdateproductState(withType: productStatusEnum.cancelWork)
        })
        
        // 3 define the UIAlertAction for close
        let closeAction = UIAlertAction(title: R.string.localizable.close(), style: .cancel)
        
        // 4 add the all action UIAlertController
        shipmentOptionMenu.addAction(dispatchAction)
        shipmentOptionMenu.addAction(arriveAction)
        shipmentOptionMenu.addAction(workInProgressAction)
        shipmentOptionMenu.addAction(completAction)
        shipmentOptionMenu.addAction(cancelAction)
        shipmentOptionMenu.addAction(closeAction)
        
        // 5 displauy the UIAlertController
        self.present(shipmentOptionMenu, animated: true, completion: nil)
    }
    
    /// update the product status bar
    func updateUIForProductStatus(state: productStatusEnum) {
        
        switch state {
        case .dispatched:
            dispatchImageView.image = R.image.checkMark()
        case .arrived:
            dispatchImageView.image = R.image.checkMark()
            arrivedImageView.image = R.image.checkMark()
        case .workInProgress:
            dispatchImageView.image = R.image.checkMark()
            arrivedImageView.image = R.image.checkMark()
            workInProgressImageView.image = R.image.checkMark()
        case .completed:
            dispatchImageView.image = R.image.checkMark()
            arrivedImageView.image = R.image.checkMark()
            workInProgressImageView.image = R.image.checkMark()
            completedImageView.image = R.image.checkMark()
        default:
            dispatchImageView.image = R.image.uncheckMark()
            arrivedImageView.image = R.image.uncheckMark()
            workInProgressImageView.image = R.image.uncheckMark()
            completedImageView.image = R.image.uncheckMark()
        }
    }
}
