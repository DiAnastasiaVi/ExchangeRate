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
    
//    var jsonUrl = URL(string: "")
    func getCurrency(on date: Date, completion: @escaping (JsonData?) -> Void) {
        //TODO: трансформувати дату в стрінг (в цій функції)
        //TODO: url + date зробити виклик по адресі
        //TODO: після успішного виклику зробити прінт(дата) - прінт результату виклику
        //TODO: декодувати дату з джсон
        //TODO: декодовану дату трансформувати в масив [CurrentDateData]
        //TODO: викликати completion [CurrentDateData]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        guard let specificDateUrl = URL(string: "https://api.privatbank.ua/p24api/exchange_rates?json&date=" + dateFormatter.string(from: date)) else {return}
//        jsonUrl = specificDateUrl
        var request = URLRequest(url: specificDateUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {return}
            do {
                let decodedData = try JSONDecoder().decode(JsonData.self, from: data)
                completion(decodedData)
            } catch {
                print(error)
                completion(nil)
            }
        }.resume()
    }
}
