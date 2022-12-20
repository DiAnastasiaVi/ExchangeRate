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
        case .noInternetConnection,
                .timedOut:
            return "Internet Error"
        case .notFound:
            return "Date Error"
        case .unexpected(_):
            return "Unexpected Error"
        }
    }
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noInternetConnection,
                .timedOut:
            return NSLocalizedString(
            "Internet Error",
            comment: "")
        case .notFound:
            return NSLocalizedString(
            "Date Error",
            comment: "")
        case .unexpected(_):
            return NSLocalizedString(
            "Unexpected Error",
            comment: "")
        }
    }
}

