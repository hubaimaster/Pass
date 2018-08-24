//
//  Market.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation
import SwiftyJSON

class Market {
    
    var id: String!
    var creationDate: Int!
    var name: String!
    var bankName: String!
    var accountNumber: String!
    var lat: Double!
    var lng: Double!
    var userId: String!
    
    init(json: JSON) {
        self.id = json["id"].string
        self.creationDate = json["creationDate"].int
        self.name = json["name"].string
        self.bankName = json["bankName"].string
        self.accountNumber = json["accountNumber"].string
        self.lat = json["lat"].double
        self.lng = json["lng"].double
        self.userId = json["userId"].string
    }
    
}
