//
//  NetworkManager.swift
//  ExchangeRate
//
//  Created by Anastasia on 21.10.2022.
//

import UIKit

//var date: String = "01.12.2014"
//let url = URL(string: "https://api.privatbank.ua/p24api/exchange_rates?json&date=\(date)")

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
   // var date: String = "01.12.2014"
    let url = "https://api.privatbank.ua/p24api/exchange_rates?json&date=" //+ date
    
    func getCurrency(on date: Date, completion: @escaping ([CurrentDateData]?) -> Void) {
        //TODO: трансформувати дату в стрінг (в цій функції)
        //TODO: url + date зробити виклик по адресі
        //TODO: після успішного виклику зробити прінт(дата) - прінт результату виклику
        //TODO: декодувати дату з джсон
        //TODO: декодовану дату трансформувати в масив [CurrentDateData]
        //TODO: викликати completion [CurrentDateData]
    }
}
