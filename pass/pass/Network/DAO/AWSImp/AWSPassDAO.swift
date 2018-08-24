//
//  AWSPassDAO.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 24..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

class AWSPassDAO: PassDAO {
    let baseUrl = "http://ec2-13-125-93-119.ap-northeast-2.compute.amazonaws.com:3000/pass"
    
    func create(userId: String, marketId: String, money: Int, tableName: String, callback: (Bool) -> Void) {
        let params: [String: Any] = ["userId": userId, "marketId": marketId, "money": money, "tableName": tableName]
        API.http.post(url: baseUrl, params: params) { (data) in
            print(data)
            if let data = data{
                
            }else{
                
            }
        }
    }
    
    func get(passId: String, callback: (Pass?) -> Void) {
        let params: [String: Any] = ["passId": passId]
        API.http.get(url: baseUrl, params: params) { (data) in
            print(data)
            if let data = data{
                
            }else{
                
            }
        }
    }
    
    func list(marketId: String, callback: ([Pass]) -> Void) {
        let params: [String: Any] = ["marketId": marketId]
        API.http.patch(url: baseUrl, params: params) { (data) in
            print(data)
            if let data = data{
                
            }else{
                
            }
        }
    }
    
    func delete(passId: String, callback: (Bool) -> Void) {
        let params: [String: Any] = ["passId": passId]
        API.http.delete(url: baseUrl, params: params) { (data) in
            print(data)
            if let data = data{
                
            }else{
                
            }
        }
    }
    
}
