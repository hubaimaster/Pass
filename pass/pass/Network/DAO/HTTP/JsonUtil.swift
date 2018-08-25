//
//  JsonUtil.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation
import SwiftyJSON

class JsonUtil {
    
    class func stringToJson(string: String?) -> JSON? {
        if let json = string{
            return JSON(parseJSON: json)
        }else{
            return nil
        }
    }
    
}
