//
//  ScreensCoordinator.swift
//  ExchangeRate
//
//  Created by Anastasia on 18.08.2022.
//

import UIKit

enum AvailableScreens {
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
        self.jumpToScreen(.currentDate)
    }
    
    // MARK: -
    // MARK: Methods
    
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
        case .currentDate:
            self.makeCurrentDateScreen()
        }
    }
}
