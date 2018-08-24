//
//  PassDAO.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 24..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

protocol PassDAO {
    func create(userId:String, marketId:String, money:Int, tableName:String, callback: (Bool)->Void)
    func get(passId: String, callback: (Pass?)->Void)
    func list(marketId: String, callback: ([Pass])->Void)
    func delete(passId: String, callback: (Bool)->Void)
}
