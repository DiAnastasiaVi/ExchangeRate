//
//  AppearanceSettings.swift
//  ExchangeRate
//
//  Created by Anastasia on 11.08.2022.
//

import UIKit

class ColorsMode {
    static let shared = ColorsMode()
    private init() { }
    
    var backgroundColor: UIColor {
        if UIViewController().isDarkMode {
            return UIColor(red: 44.0/255.0, green: 19.0/255.0, blue: 0.0/255.0, alpha: 255.0)
        }
        else {
            return UIColor(red: 172.0/255.0, green: 123.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        }
    }
}

class Fonts {
    static let shared = Fonts()
    private init() { }
    
    var regular = UIFont.systemFont(ofSize: 17.0)
}
