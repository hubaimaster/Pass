//
//  Market.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation
import UIKit


class MarketCellModel: CellModel {
    
    var market: Market!
    var name: String!
    var desc: String!
    var image: UIImage!
    
    static var imageCount = 0
    
    class func getImage() -> UIImage {
        let images = [#imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "8"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "4"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "5")]
        let diceRoll = imageCount % images.count
        imageCount += 1
        return images[diceRoll]
    }
    
    init(market: Market) {
        self.market = market
        self.name = market.name
        self.desc = market.desc
        self.image = MarketCellModel.getImage()
    }
    
}
