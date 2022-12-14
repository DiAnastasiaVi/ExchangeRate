//
//  NetworkManager.swift
//  ExchangeRate
//
//  Created by Anastasia on 21.10.2022.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    let jsonUrl = "https://api.privatbank.ua/p24api/exchange_rates?json&date="
    
    func getCurrency(on date: Date, completion: @escaping ([CurrentDateData]?) -> Void, onFailure: @escaping (CustomError) -> ()) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.timeZone = TimeZone.current
        guard let specificDateUrl = URL(string: jsonUrl + dateFormatter.string(from: date)) else {return}
        var request = URLRequest(url: specificDateUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
    
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                onFailure(CustomError.noInternetConnection)
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(JsonData.self, from: data)
                completion(decodedData.exchangeRate.compactMap{
                    guard let currency = $0.currency,
                    currency != "UAH"
                    else { return nil }
                    return CurrentDateData(currency: currency, saleRateNB: $0.saleRateNB)
                })
            } catch {
                if error is DecodingError {
                    onFailure(CustomError.notFound)
                }
                else {
                    onFailure(CustomError.unexpected)
                }
            }
        }.resume()
    }
}
