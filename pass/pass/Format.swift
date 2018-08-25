//
//  Format.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

class Format {
    
    static func timeAgoSince(from: Int)->String{
        let date = Date(timeIntervalSince1970: TimeInterval(from) / 1000.0)
        return timeAgoSince(date: date)
    }
    
    static func timeAgoSince(date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        print("nowe:\(now.timeIntervalSince1970)")
        print("date:\(date.timeIntervalSince1970)")
        let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = (calendar as NSCalendar).components(unitFlags, from: date, to: now, options: [])
        
        if let year = components.year, year >= 1 {
            return "\(year) " + "년 전"
        }
        
        if let month = components.month, month >= 1 {
            return "\(month) " + "달 전"
        }
        
        if let week = components.weekOfYear, week >= 1 {
            return "\(week) " + "주일 전"
        }
        
        if let day = components.day, day >= 2 {
            return "\(day) " + "일 전"
        }
        
        if let day = components.day, day >= 1 {
            return "어제"
        }
        
        if let hour = components.hour, hour >= 1 {
            return "\(hour) " + "시간 전"
        }
        
        if let minute = components.minute, minute >= 1 {
            return "\(minute) " + "분"
        }
        
        if let second = components.second, second >= 3 {
            return "조금 전"
            //return "\(second) " + "초"
        }
        return "방금"
    }

}
