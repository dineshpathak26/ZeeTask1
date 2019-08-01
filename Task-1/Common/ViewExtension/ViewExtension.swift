//
//  ViewExtension.swift
//  Task-1
//
//  Created by Dinesh on 31/07/2019.
//  Copyright © 2019 Dinesh. All rights reserved.
//

import UIKit

/// UIView extension for set the view outlet and define onces and use that in project
extension UIView {
    
    /// set bottom shadow with corner redius of the view
    func setBottomShadow(_ cornerRadius: CGFloat = 0.0, _ shadowColor: CGColor = UIColor.darkText.cgColor) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 2.5
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
    }
    
    /// set top shadow of the view
    func setTopShadow() {
        layer.shadowColor = UIColor.darkText.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: -3.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 2.5
        layer.masksToBounds = false
    }
    
    /// set corner radius with border of the view
    func setCornerRadiusWithBorder(_ borderColor: CGColor = UIColor(red: 241.0/255.0, green: 91.0/255.0, blue: 67.0/255.0, alpha: 1).cgColor, _ cornerRadius: CGFloat = 4.0, _ borderWidth: CGFloat = 0.5) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
    }
    
    /// set round corner of the view
    func roundCorner() {
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
}
