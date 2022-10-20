//
//  CurrentDateModel.swift
//  ExchangeRate
//
//  Created by Anastasia on 20.10.2022.
//

import Foundation

//class CurrentDateModel {
//    public var collectionData: [CurrentDateData] = []
//}

struct CurrentDateData {
    var currency: CurrentDateCases
    var rate: Double
}

enum CurrentDateCases: String, CaseIterable {
    case aud = "AUD"
    case cad = "CAD"
    case czk = "CZK"
    case dkk = "DKK"
    case huf = "HUF"
    case ils = "ILS"
    case jpy = "JPY"
    case lvl = "LVL"
    case ltl = "LTL"
    case nok = "NOK"
    case skk = "SKK"
    case sek = "SEK"
    case chf = "CHF"
    case gbp = "GBP"
    case usd = "USD"
    case byr = "BYR"
    case eur = "EUR"
    case gel = "GEL"
    case plz = "PLZ"
    
//    public var getImageName: String {
//        switch self {
//        case .
//        }
//    }
}
