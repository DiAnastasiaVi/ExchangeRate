//
//  AppDelegate.swift
//  ExchangeRate
//
//  Created by Anastasia on 01.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: -
    // MARK: Properties

    var window: UIWindow?
    var appConfigurator: AppConfigurator?

    // MARK: -
    // MARK: Methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.appConfigurator = AppConfigurator(window: window)
        return true
    }
}

