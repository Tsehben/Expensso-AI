//
//  Date+Extension.swift
//  Expensso AI
//
//  Created by Ebenezer Tseh on 8/19/24.
//

import Foundation


extension Date {
    
    var startOfDay: Date {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: self)
        return startDate
    }
    
    var endOfDay: Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = 1
        
        let startOfNextDay = calendar.date(byAdding: components, to: calendar.startOfDay(for: self))!
        let endOfDay = startOfNextDay.addingTimeInterval(-1)
        return endOfDay
    }

}
