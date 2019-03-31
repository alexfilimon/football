//
//  Date.swift
//  Football
//
//  Created by Alexander Filimonov on 31/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

extension Date {
    static func getDate(from dateStr: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale.current
        return formatter.date(from: dateStr)
    }

    public func getString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
}
