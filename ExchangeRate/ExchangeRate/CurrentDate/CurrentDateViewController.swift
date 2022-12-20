//
//  CurrentDateViewController.swift
//  ExchangeRate
//
//  Created by Anastasia on 29.08.2022.
//

import UIKit

enum CurrentDateEvents {
    case loadData
    case dateChanged
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
        self.view.backgroundColor = ColorsMode.shared.color
        
        self.mainView?.tableView?.dataSource = self
        self.mainView?.tableView?.delegate = self
        loadData("")
    }
    
    deinit {
        print("Deinit: \(Self.self)")
    }
    
    @IBAction func loadData(_ sender: Any) {
        eventHandler?(.loadData)

        model.refreshData(for: model.todayOrYesterday) {
            self.mainView?.tableView?.reloadData()
        } onFailure: {text in
            self.showError(err: text)
        }
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        eventHandler?(.dateChanged)
        model.refreshData(for: sender.date) {
            self.mainView?.tableView?.reloadData()
        } onFailure: {text in
            self.showError(err: text)
        }
    }
    
    public func changeDate() {
        
        
    }
    
    private func showError(err: String) {
        let alert = UIAlertController(title: "Error", message: err, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
