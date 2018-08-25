//
//  PassCellModel.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation


class PassCellModel: CellModel {
    
    var tableName: String!
    var money: Int!
    var creationDate: Int!
    
    init(pass: Pass) {
        self.tableName = pass.tableName
        self.money = pass.money
        self.creationDate = pass.creationDate
    }
    
}
