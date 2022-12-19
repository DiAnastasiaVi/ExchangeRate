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
    case timedOut
    case unexpected(code: Int)
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
            return "1"
        case .notFound:
            return "2"
        case .timedOut:
            return "3"
        case .unexpected(_):
            return "4"
        }
    }
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return NSLocalizedString(
            "01",
            comment: "001")
        case .notFound:
            return NSLocalizedString(
            "02",
            comment: "002")
        case .timedOut:
            return NSLocalizedString(
            "03",
            comment: "003")
        case .unexpected(_):
            return NSLocalizedString(
            "04",
            comment: "004")
        }
    }
}

