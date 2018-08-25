//
//  PassCell.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation
import UIKit

class PassCell: UITableViewCell {
    
    @IBOutlet weak var tableNameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var data: PassCellModel!{
        didSet{
            self.layoutSubviews()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        prepare()
    }
    
    func prepare() {
        prepareTableNameLabel()
        prepareMoneyLabel()
        prepareTimeLabel()
    }
    
    func prepareTableNameLabel(){
        if let name = data.tableName{
            tableNameLabel.text = "테이블 \(name)"
        }
    }
    
    func prepareMoneyLabel(){
        if let money = data.money{
            moneyLabel.text = "\(money)원 결제"
        }
    }
    
    func prepareTimeLabel(){
        if let date = data.creationDate{
            timeLabel.text = Format.timeAgoSince(from: date)
        }
    }
    
}
