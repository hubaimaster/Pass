//
//  AWSMarketDAO.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 24..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

class AWSMarketDAO: MarketDAO {
    let baseUrl = "http://ec2-13-125-93-119.ap-northeast-2.compute.amazonaws.com:3000/market"
    
    func create(userId: String, name: String, desc: String, bankName: String, accountNumber: String, lat: Double, lng: Double, callback: @escaping (Bool) -> Void) {
        let params: [String: Any] = ["userId": userId, "name": name, "desc": desc, "bankName": bankName, "accountNumber": accountNumber, "lat": lat, "lng": lng]
        API.http.post(url: baseUrl, params: params) { (data) in
            if let json = JsonUtil.stringToJson(string: data), let success = json["success"].bool, success{
                callback(true)
            }else{
                callback(false)
            }
        }
    }
    
    func get(marketId: String, callback: @escaping (Market?) -> Void) {
        let params: [String: Any] = ["marketId": marketId]
        API.http.get(url: baseUrl, params: params) { (data) in
            if let json = JsonUtil.stringToJson(string: data){
                let market = Market(json: json)
                callback(market)
            }else{
                callback(nil)
            }
        }
    }
    
    func list(lat: Double, lng: Double, callback: @escaping ([Market]) -> Void) {
        let params: [String: Any] = ["lat": lat, "lng": lng]
        API.http.patch(url: baseUrl + "/near" , params: params) { (data) in
            if let json = JsonUtil.stringToJson(string: data), let items = json["data"].array{
                let markets = items.map({ (json) -> Market in
                    return Market(json: json)
                })
                callback(markets)
            }
        }
    }
    
    func list(userId: String, callback: @escaping ([Market])->Void){
        let params: [String: Any] = ["userId": userId]
        API.http.patch(url: baseUrl + "/users" , params: params) { (data) in
            if let json = JsonUtil.stringToJson(string: data), let items = json["data"].array{
                let markets = items.map({ (json) -> Market in
                    return Market(json: json)
                })
                callback(markets)
            }
        }
    }
    
}
