//
//  CurrentDateModel.swift
//  ExchangeRate
//
//  Created by Anastasia on 20.10.2022.
//

import Foundation
import UIKit

class CurrentDateModel {
    public var collectionModelData: [CurrentDateData] = []
    
    public var todayOrYesterday = Date()
    func refreshData(for date: Date, onSuccess: @escaping () -> (), onFailure: @escaping (String) -> ()) {
        NetworkManager.shared.getCurrency(on: date) {
            self.collectionModelData = $0 ?? []
            DispatchQueue.main.async {
                onSuccess()
            }
        } onFailure: { error in
            var failureMessage = ""
            DispatchQueue.main.async {
                if error is DecodingError {
                    failureMessage = CustomError.notFound.description
                    self.todayOrYesterday = Date.yesterday
                }
                onFailure(failureMessage)
            }
        }
    }
}

struct CurrentDateData: Codable {
    var currency: String
    var saleRateNB: Double
    
    public enum CodingKeys: String, CodingKey {
        case currency
        case saleRateNB
    }
}
