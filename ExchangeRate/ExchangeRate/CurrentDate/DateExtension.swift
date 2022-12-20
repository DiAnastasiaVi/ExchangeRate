//
//  DateExtension.swift
//  ExchangeRate
//
//  Created by Anastasia on 20.12.2022.
//

import UIKit

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: .now)!
    }
}
