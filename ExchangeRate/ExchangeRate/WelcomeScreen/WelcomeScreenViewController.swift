//
//  MainScreenViewController.swift
//  ExchangeRate
//
//  Created by Anastasia on 03.08.2022.
//

import UIKit

enum WelcomeScreenEvents {
    case startButtonPressed
}

class WelcomeScreenViewController: UIViewController, StoryboardLoadable {

    //MARK: -
    //MARK: Properties
    
    public var eventHandler: ((WelcomeScreenEvents) -> Void)?
    private var mainView: WelcomeScreenView? {
        return self.view as? WelcomeScreenView
    }
    
    
    //MARK: -
    //MARK: Init and Deinit
    
    public static func startVC() -> WelcomeScreenViewController {
        let contr = self.loadFromStoryboard(storyboardName: "WelcomeScreen")
        return contr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView?.commonSetup()
        self.view.backgroundColor = .blue
    }
    
    deinit {
        print("Deinit: \(Self.self)")
    }



}
