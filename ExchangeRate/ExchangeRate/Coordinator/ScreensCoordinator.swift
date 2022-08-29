//
//  ScreensCoordinator.swift
//  ExchangeRate
//
//  Created by Anastasia on 18.08.2022.
//

import UIKit

enum AvailableScreens {
    case welcomeScreen
    case currentDate
}

final class ScreensCoordinator: Coordinator {
    
    //MARK: -
    //MARK: Constants
    
    public let navigationController: UINavigationController
    
    //MARK: -
    //MARK: Properties
    
    private var navigationScreens: [AvailableScreens] = []
    
    //MARK: -
    //MARK: Init and Deinit
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func start() {
        self.jumpToScreen(.welcomeScreen)
    }
    
    // MARK: -
    // MARK: Methods
    
    private func makeWelcomeScreen() {
        let contr = WelcomeScreenViewController.startVC()
        self.navigationScreens.append(.welcomeScreen)
        self.navigationController.navigationBar.isHidden = true
        contr.eventHandler = {[weak self] event in
            switch event {
            case .startButtonPressed:
                self?.jumpToScreen(.currentDate)
            }
        }
        self.navigationController.pushViewController(contr, animated: true)
        self.navigationController.setViewControllers([contr], animated: false)
    }
    
    private func makeCurrentDateScreen() {
        let contr = CurrentDateViewController.startVC()
        self.navigationScreens.append(.currentDate)
        self.navigationController.navigationBar.isHidden = true
        self.navigationController.pushViewController(contr, animated: true)
        self.navigationController.setViewControllers([contr], animated: false)
    }
}

//MARK: -
//MARK: Extensions

extension ScreensCoordinator {
    public func jumpToScreen(_ jumpTo: AvailableScreens) {
        switch jumpTo {
        case .welcomeScreen:
            self.makeWelcomeScreen()
        case .currentDate:
            self.makeCurrentDateScreen()
        }
    }
}
