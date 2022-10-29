//
//  CurrentDateViewController.swift
//  ExchangeRate
//
//  Created by Anastasia on 29.08.2022.
//

import UIKit

enum CurrentDateEvents {
    case something
}

class CurrentDateViewController: UIViewController, StoryboardLoadable {
    
    //MARK: -
    //MARK: Properties
    
    public var eventHandler: ((CurrentDateEvents) -> Void)?
    private var mainView: CurrentDateView? {
        return self.view as? CurrentDateView
    }
    internal var model = CurrentDateModel()
    internal let cellId = "cell"
    
    //MARK: -
    //MARK: Init and Deinit
    
    public static func startVC() -> CurrentDateViewController {
        let contr = self.loadFromStoryboard(storyboardName: "CurrentDate")
        return contr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView?.commonSetup()
        self.view.backgroundColor = Colors.shared.exchangeYellow
        
        self.mainView?.tableView?.dataSource = self
        self.mainView?.tableView?.delegate = self
    }
    
    deinit {
        print("Deinit: \(Self.self)")
    }
}
