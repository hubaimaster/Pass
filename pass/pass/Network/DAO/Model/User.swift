//
//  User.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    
    var id: String!
    var creationDate: Int!
    var name: String!
    var password: String!
    var group: String!
    var email: String!
    var marketId: String!
    var money: Int!
    
    init(json: JSON) {
        self.id = json["id"].string
        self.creationDate = json["creationDate"].int
        self.name = json["name"].string
        self.password = json["password"].string
        self.group = json["group"].string
        self.email = json["email"].string
        self.marketId = json["marketId"].string
        self.money = json["money"].int
    }
    
}
