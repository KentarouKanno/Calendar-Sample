
//
//  DataManager.swift
//  Calendar
//
//  Created by Kentarou on 2018/05/03.
//  Copyright © 2018年 Kentarou. All rights reserved.
//

import Foundation


class DateManager {
    
    var currentMonthOfDates: [Date] = []
    var selectedDate = Date()
    let daysPerWeek = 7
    var numberOfItems: Int = 0
    
    var daysAcquisition: Int {
        if let date = firstDateOfMonth(), let rangeOfWeeks = Calendar.current.range(of: .weekOfMonth, in: .month, for: date) {
            // 月が持つ週の数
            let numberOfWeeks = rangeOfWeeks.count
            // 週の数 * 列の数
            numberOfItems = numberOfWeeks * daysPerWeek
            return numberOfItems
        }
        return 0
    }
    
    func firstDateOfMonth() -> Date? {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: selectedDate)
        components.day = 1
        if let firstDateMonth = Calendar.current.date(from: components) {
            return firstDateMonth
        }
        return nil
    }
    
    func dateForCellAtIndexPath(_ numberOfItems: Int) {
        
        if let firstDateOfMonth = firstDateOfMonth(),
            let ordinalityOfFirstDay = Calendar.current.ordinality(of: .day, in: .weekOfMonth, for: firstDateOfMonth) {
            
            for i in 0..<numberOfItems {
                var dateComponents = DateComponents()
                dateComponents.day = i - (ordinalityOfFirstDay - 1)
                if let date = Calendar.current.date(byAdding: dateComponents, to: firstDateOfMonth) {
                    currentMonthOfDates.append(date)
                }
            }
        }
    }
    
    func conversionDateFormat(indexPath: IndexPath) -> String {
        dateForCellAtIndexPath(numberOfItems)
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: currentMonthOfDates[indexPath.row])
    }
    
    func prevMonth(date: Date) -> Date? {
        currentMonthOfDates = []
        if let date = date.monthAgoDate() {
            selectedDate = date
            return selectedDate
        }
        return nil
    }
    
    func nextMonth(date: Date) -> Date? {
        currentMonthOfDates = []
        if let date = date.monthLaterDate() {
            selectedDate = date
            return selectedDate
        }
        return nil
    }
}
