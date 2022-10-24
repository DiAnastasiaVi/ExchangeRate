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
    
    func getCurrency(on date: Date, completion: @escaping ([CurrentDateData]?) -> Void) {
        //TODO: трансформувати дату в стрінг (в цій функції)
        //TODO: url + date зробити виклик по адресі
        //TODO: після успішного виклику зробити прінт(дата) - прінт результату виклику
        //TODO: декодувати дату з джсон
        //TODO: декодовану дату трансформувати в масив [CurrentDateData]
        //TODO: викликати completion [CurrentDateData]
        
        //1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        //2
        guard let specificDateUrl = URL(string: "https://api.privatbank.ua/p24api/exchange_rates?json&date=" + dateFormatter.string(from: date)) else {return}
        print(specificDateUrl)
        
        //
        var request = URLRequest(url: specificDateUrl)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            print(data)
            print(error?.localizedDescription)
        }.resume()
    }
}
