//
//  Date+Extensions.swift
//  Github Followers
//
//  Created by Mehmet Ali Özdemir on 25.07.2023.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
