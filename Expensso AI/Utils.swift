//
//  Utils.swift
//  Expensso AI
//
//  Created by Ebenezer Tseh on 7/24/24.
//

import Foundation

struct Utils {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
        
    } ()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        return formatter
        
        
    } ()
    
}

// complete work
