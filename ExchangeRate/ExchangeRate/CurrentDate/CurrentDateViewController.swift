//
//  CurrentDateViewController.swift
//  ExchangeRate
//
//  Created by Anastasia on 29.08.2022.
//

import UIKit

enum CurrentDateEvents {
    case startButtonPresed
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
        self.mainView?.welcomeViewSetup()
        self.view.backgroundColor = Colors.shared.iconOrange
        
        self.mainView?.tableView?.dataSource = self
        self.mainView?.tableView?.delegate = self
//        self.mainView?.tableView?.register(CurrentDateTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    deinit {
        print("Deinit: \(Self.self)")
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        NetworkManager.shared.getCurrency(on: Date()) {_ in
        }
//        mainView?.self.tableView?.reloadData()
        self.mainView?.tableView?.beginUpdates()
        self.mainView?.tableView?.reloadRows(at: (self.mainView?.tableView?.indexPathsForVisibleRows)!, with: .none)
        self.mainView?.tableView?.endUpdates()
        print(self.mainView?.tableView?.visibleCells)
        self.mainView?.welcomeView?.isHidden = true
        eventHandler?(.startButtonPresed)
    }
    
}
