//
//  PassDAO.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 24..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

protocol PassDAO {
    func create(userId:String, marketId:String, money:Int, tableName:String, callback: @escaping (Bool)->Void)
    func get(passId: String, callback: @escaping (Pass?)->Void)
    func list(marketId: String, callback: @escaping ([Pass])->Void)
    func delete(passId: String, callback: @escaping (Bool)->Void)
}
