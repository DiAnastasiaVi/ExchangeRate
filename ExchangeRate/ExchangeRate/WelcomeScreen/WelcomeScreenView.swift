//
//  MainScreenView.swift
//  ExchangeRate
//
//  Created by Anastasia on 03.08.2022.
//

import UIKit
//import PinLayout

class WelcomeScreenView: UIView {
    
    //MARK: -
    //MARK: Properties
    
    @IBOutlet weak var imageView: UIImageView?
    
    // MARK: -
    // MARK: Public Methods
    
    public func commonSetup(){
        setImageView()
        setImageViewConstraints()
    }
    
    // MARK: -
    // MARK: Private Methods
    
    private func setImageView(){
        let exchangeImage = UIImage(named: "1")
        imageView?.image = exchangeImage
        imageView?.contentMode = .top
        imageView?.semanticContentAttribute = .forceLeftToRight
        
    }
    
    private func setImageViewConstraints(){
        let safeArea = self.safeAreaLayoutGuide
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        imageView?.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageView?.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        imageView?.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
}

