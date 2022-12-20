//
//  Error.swift
//  ExchangeRate
//
//  Created by Anastasia on 19.12.2022.
//

import UIKit

enum CustomError: Error {
    case noInternetConnection
    case notFound
    case unexpected
}

extension CustomError {
    var isFatal: Bool {
        if case CustomError.unexpected = self { return true }
        else { return false }
    }
}

extension CustomError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .noInternetConnection:
            return "The Internet connection appears to be offline".localized()
        case .notFound:
            return "Today's rate has not been updated yet. Check out yesterday's rate".localized()
        case .unexpected:
            return "Something went wrong. Try again later".localized()
        }
    }
}


