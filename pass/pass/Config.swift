//
//  config.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation
import UIKit

struct Config {
    
    struct color {
        static let primaryTint = #colorLiteral(red: 0.3116663098, green: 0.6629442573, blue: 0.1113548353, alpha: 1)
        static let secondaryTint = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    struct vc {
        static let EntryViewController = "EntryViewController"
        static let RegisterViewController = "RegisterViewController"
        static let LoginViewController = "LoginViewController"
        
        static let UserPage = "UserPage"
        static let ManagerPage = "ManagerPage"
        
        static let AddMarketViewController = "AddMarketViewController"
    }
    
    struct cell {
        static let MarketCell = "MarketCell"
    }
    
}
