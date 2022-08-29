//
//  AppConfigurator.swift
//  ExchangeRate
//
//  Created by Anastasia on 29.08.2022.
//

import UIKit

final class AppConfigurator {

    private var coordinator: Coordinator?

    init(window: UIWindow) {
        self.configure(window: window)
    }

    private func configure(window: UIWindow) {

        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        navigationController.navigationBar.isHidden = true
        self.coordinator = ScreensCoordinator(navigationController: navigationController)
        self.coordinator?.start()
        window.makeKeyAndVisible()
    }
}

