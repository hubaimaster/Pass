//
//  MarketCell.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation
import UIKit

class MarketCell: UITableViewCell {
    
    var data: MarketCellModel!{
        didSet{
            self.layoutSubviews()
        }
    }
    
    @IBOutlet weak var marketImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        prepare()
    }
    
    func prepare(){
        prepareMarketImageView()
        prepareTitleLabel()
        prepareDescLabel()
    }
    
    func prepareMarketImageView(){
        marketImageView.image = data?.image
        marketImageView.layer.cornerRadius = 10
        marketImageView.layer.masksToBounds = true
        marketImageView.contentMode = .scaleAspectFill
    }
    
    func prepareTitleLabel(){
        print("data.name:\(data.name)")
        titleLabel.text = data.name
    }
    
    func prepareDescLabel(){
        descLabel.text = data.desc
    }
    
}
