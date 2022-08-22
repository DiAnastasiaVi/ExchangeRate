//
//  AppearanceSettings.swift
//  ExchangeRate
//
//  Created by Anastasia on 11.08.2022.
//

import UIKit

class Colors {
    static let shared = Colors()
    private init() { }

    var iconOrange = UIColor(red: 251/255.0, green: 123/255.0, blue: 11/255.0, alpha: 1.0)
    var yellow1 = UIColor(red: 242.0/255.0, green: 178.0/255.0, blue: 76.0/255.0, alpha: 1.0)
    var yellow2 = UIColor(red: 239.0/255.0, green: 162.0/255.0, blue: 39.0/255.0, alpha: 1.0)
    var exchangeYellow = UIColor(red: 252.0/255.0, green: 176.0/255.0, blue: 21.0/255.0, alpha: 255.0)
    var black = UIColor.black
}

class Fonts {
    static let shared = Fonts()
    private init() { }
    
    var regular = UIFont.systemFont(ofSize: 17.0)
    var startButton = UIFont.systemFont(ofSize: 40.0)
}
