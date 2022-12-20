//
//  StringExtension.swift
//  ExchangeRate
//
//  Created by Anastasia on 20.12.2022.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
