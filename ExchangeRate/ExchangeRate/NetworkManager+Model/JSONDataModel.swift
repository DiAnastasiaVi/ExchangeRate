//
//  JSONDataModel.swift
//  ExchangeRate
//
//  Created by Anastasia on 28.10.2022.
//

import Foundation

class JsonDataModel: Codable {
    public var result: [JsonData]
}

struct JsonData: Codable {
    let date, bank: String
    let baseCurrency: Int
    let baseCurrencyLit: BaseCurrency
    let exchangeRate: [ExchangeRate]
    
    enum BaseCurrency: String, Codable {
        case uah = "UAH"
    }
    
    struct ExchangeRate: Codable {
        let baseCurrency: BaseCurrency
        let currency: String?
        let saleRateNB, purchaseRateNB: Double
        let saleRate, purchaseRate: Double?
    }
}
