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
    var password: String!
    var group: String!
    var email: String!
    var money: Int!
    
    init(json: JSON) {
        let json = json["data"]
        self.id = json["_id"].string
        self.creationDate = json["creationDate"].int
        self.password = json["password"].string
        self.group = json["group"].string
        self.email = json["email"].string
        self.money = json["money"].int
    }
    
}
