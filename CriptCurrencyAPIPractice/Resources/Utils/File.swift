//
//  File.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-11.
//

import Foundation
class DateFormatters{
    
    static func dateForMatter(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM d, yyyy at HH:mm"
        return formatter.string(from: date)
    }
    
}
