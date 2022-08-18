//
//  Coordinator.swift
//  ExchangeRate
//
//  Created by Anastasia on 18.08.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
