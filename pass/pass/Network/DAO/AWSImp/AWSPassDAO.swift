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
    
    func create(userId: String, marketId: String, money: Int, tableName: String, callback: @escaping (Pass?) -> Void) {
        let params: [String: Any] = ["userId": userId, "marketId": marketId, "money": money, "tableName": tableName]
        API.http.post(url: baseUrl, params: params) { (data) in
            if let json = JsonUtil.stringToJson(string: data){
                let pass = Pass(json: json)
                callback(pass)
            }else{
                callback(nil)
            }
        }
    }
    
    func get(passId: String, callback: @escaping (Pass?) -> Void) {
        let params: [String: Any] = ["passId": passId]
        API.http.get(url: baseUrl, params: params) { (data) in
            if let json = JsonUtil.stringToJson(string: data){
                let pass = Pass(json: json)
                callback(pass)
            }else{
                callback(nil)
            }
        }
    }
    
    func list(marketId: String, callback: @escaping ([Pass]) -> Void) {
        let params: [String: Any] = ["marketId": marketId]
        API.http.patch(url: baseUrl, params: params) { (data) in
            if let json = JsonUtil.stringToJson(string: data), let items = json["data"].array{
                let passes = items.map({ (json) -> Pass in
                    let pass = Pass(json: json)
                    return pass
                })
                callback(passes)
            }
        }
    }
    
    func delete(passId: String, callback: @escaping (Bool) -> Void) {
        let params: [String: Any] = ["passId": passId]
        API.http.delete(url: baseUrl, params: params) { (data) in
            if let json = JsonUtil.stringToJson(string: data), let success = json["success"].bool, success{
                callback(true)
            }else{
                callback(false)
            }
        }
    }
    
    func put(passId: String, callback: @escaping (Bool) -> Void) {
        let params: [String: Any] = ["passId": passId]
        API.http.delete(url: baseUrl, params: params) { (data) in
            if let json = JsonUtil.stringToJson(string: data), let success = json["success"].bool, success{
                callback(true)
            }else{
                callback(false)
            }
        }
    }
    
}
