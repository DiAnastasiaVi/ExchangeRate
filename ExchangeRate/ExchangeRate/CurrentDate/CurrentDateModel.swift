//
//  CurrentDateModel.swift
//  ExchangeRate
//
//  Created by Anastasia on 20.10.2022.
//

import Foundation

class CurrentDateModel {
    public var collectionModelData: [CurrentDateData] = []
    
    func refreshData(for date: Date, onSuccess: @escaping () -> (), onFailure: @escaping (String) -> ()) {
        NetworkManager.shared.getCurrency(on: date) {
            self.collectionModelData = $0 ?? []
            DispatchQueue.main.async {
                onSuccess()
            }
        } onFailure: { error in
            DispatchQueue.main.async {
                onFailure("\(error)")
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
