//
//  CommonConstant.swift
//  Task-1
//
//  Created by Dinesh on 31/07/19.
//  Copyright © 2019 Dinesh. All rights reserved.
//

import UIKit

class CommonConstant: NSObject {

    ///
    static let isiPhone5: Bool = 568 == UIScreen.main.bounds.size.height ? true : false
    ///
    static let isiPhone6: Bool = 667 == UIScreen.main.bounds.size.height ? true : false
    ///
    static let isiPhone6Plus: Bool = 736 == UIScreen.main.bounds.size.height ? true : false
    ///
    static let isiPhoneX: Bool = 812 == UIScreen.main.bounds.size.height ? true : false
    ///
    static let isiPhoneXR: Bool = 896 == UIScreen.main.bounds.size.height ? true : false
}
