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
    
    func create(userId: String, name: String, bankName: String, accountNumber: String, lat: Double, lng: Double, callback: (Bool) -> Void) {
        let params: [String: Any] = ["userId": userId, "name": name, "bankName": bankName, "accountNumber": accountNumber, "lat": lat, "lng": lng]
        API.http.post(url: baseUrl, params: params) { (data) in
            print(data)
            if let data = data{
                
            }else{
                
            }
        }
    }
    
    func get(marketId: String, callback: (Market?) -> Void) {
        let params: [String: Any] = ["marketId": marketId]
        API.http.get(url: baseUrl, params: params) { (data) in
            print(data)
            if let data = data{
                
            }else{
                
            }
        }
    }
    
    func list(lat: Double, lng: Double, callback: ([Market]) -> Void) {
        let params: [String: Any] = ["lat": lat, "lng": lng]
        API.http.patch(url: baseUrl, params: params) { (data) in
            print(data)
            if let data = data{
                
            }else{
                
            }
        }
    }
    
    
}
