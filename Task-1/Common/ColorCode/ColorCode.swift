//
//  ColorCode.swift
//  Task-1
//
//  Created by Dinesh on 01/08/2019.
//  Copyright © 2019 Dinesh. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    class var borderColor: UIColor {
        return UIColor(red: 99.0/255.0, green: 187.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    }
}
