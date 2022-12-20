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

    var iconColor = UIColor(red: 172.0/255.0, green: 123.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    var darkVersion = UIColor(red: 44.0/255.0, green: 19.0/255.0, blue: 0.0/255.0, alpha: 255.0)
}

class Fonts {
    static let shared = Fonts()
    private init() { }
    
    var regular = UIFont.systemFont(ofSize: 17.0)
    var startButton = UIFont.systemFont(ofSize: 40.0)
}
