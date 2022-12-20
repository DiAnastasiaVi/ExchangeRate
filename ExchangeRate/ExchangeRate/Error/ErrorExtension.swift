//
//  ErrorExtension.swift
//  ExchangeRate
//
//  Created by Anastasia on 20.12.2022.
//

import UIKit

public extension Error {
    var isOfflineError: Bool {
        return [NSURLErrorTimedOut, NSURLErrorNotConnectedToInternet].contains((self as NSError).code)
    }
}

