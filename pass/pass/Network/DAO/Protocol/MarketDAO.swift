//
//  MarketDAO.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 24..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

protocol MarketDAO {
    func create(userId: String, name: String, bankName: String, accountNumber:String, lat:Double, lng:Double, callback: (Bool)->Void)
    func get(marketId:String, callback: (Market)->Void)
    func list(lat:Double, lng:Double, callback: ([Market])->Void)
}
