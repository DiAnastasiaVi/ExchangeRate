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
    internal var model = CurrentDateModel()
    internal let cellId = "cell"
    private var mainView: CurrentDateView? {
        return self.view as? CurrentDateView
    }
    
    //MARK: -
    //MARK: Init and Deinit
    
    public static func startVC() -> CurrentDateViewController {
        let contr = self.loadFromStoryboard(storyboardName: "CurrentDate")
        return contr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView?.commonSetup()
        self.view.backgroundColor = ColorsMode.shared.backgroundColor
        
        self.mainView?.tableView?.dataSource = self
        self.mainView?.tableView?.delegate = self
        loadData("")
    }
    
    deinit {
        print("Deinit: \(Self.self)")
    }
    
    //MARK: -
    //MARK: @IBAction
    
    @IBAction func loadData(_ sender: Any) {
        self.on()
        eventHandler?(.loadData)

        model.refreshData(for: UIDatePicker().date) {
            self.off()
            self.mainView?.tableView?.reloadData()
        } onFailure: {text in
            self.showError(err: text)
            self.off()
        }
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        self.on()
        eventHandler?(.dateChanged)
        
        model.refreshData(for: sender.date) {
            self.off()
            self.mainView?.tableView?.reloadData()
        } onFailure: {text in
            self.showError(err: text)
            self.off()
        }
    }

    //MARK: -
    //MARK: Private Methods
    
    private func showError(err: String) {
        let alert = UIAlertController(title: "Error".localized(), message: err, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func on() {
        LoadingOverlay.shared.showOverlay()
        view.isUserInteractionEnabled = false
    }
    
    private func off() {
        LoadingOverlay.shared.hideOverlayView()
        self.view.isUserInteractionEnabled = true
    }
}
