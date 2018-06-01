//
//  Date+.swift
//  Calendar
//
//  Created by Kentarou on 2018/05/03.
//  Copyright © 2018年 Kentarou. All rights reserved.
//

import Foundation

extension Date {
    
    func monthAgoDate() -> Date? {
        let addValue = -1
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return calendar.date(byAdding: dateComponents, to: self)
    }
    
    func monthLaterDate() -> Date? {
        let addValue = 1
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return calendar.date(byAdding: dateComponents, to: self)
    }
}
