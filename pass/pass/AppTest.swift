//
//  AppTest.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

class AppTest {
    
    private init(){}
    static let shared = AppTest()
    
    func entryTrigger(){
        modelTest()
    }
    
    //--------------
    
    
    func modelTest(){
        print("API.model.user.signIn")
        API.model.user.signIn(email: "TestEmail", password: "pass1234") { (data) in
            
        }
        print("API.model.user.signUp")
        API.model.user.signUp(email: "TestEmail", password: "pass1234", group: "user") { (success) in
            
        }
        print("API.model.pass.create")
        API.model.pass.create(userId: "userIdTest", marketId: "markeyIdTest", money: 1000, tableName: "TableNameTest") { (success) in
            
        }
        print("API.model.pass.delete")
        API.model.pass.delete(passId: "passIdTest") { (success) in
            
        }
        print("API.model.pass.get")
        API.model.pass.get(passId: "passIdTest") { (pass) in
            
        }
        print("API.model.pass.list")
        API.model.pass.list(marketId: "marketIdTest") { (passes) in
            
        }
        print("API.model.market.create")
        API.model.market.create(userId: "userIdTest", name: "name", bankName: "bankName", accountNumber: "1002-test", lat: 35.15, lng: 125.55) { (success) in
            
        }
        print("API.model.market.get")
        API.model.market.get(marketId: "marketIdTest") { (market) in
            
        }
        print("API.model.market.list")
        API.model.market.list(lat: 23.35, lng: 122.223222) { (markets) in
            
        }
    }
    
}
