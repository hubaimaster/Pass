//
//  API.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 24..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

struct API {
    static let http: Network = AlamofireNetwork()
    
    struct model {
        static let user: UserDAO = AWSUserDAO()
        static let pass: PassDAO = AWSPassDAO()
        static let market: MarketDAO = AWSMarketDAO()
    }
    
}
