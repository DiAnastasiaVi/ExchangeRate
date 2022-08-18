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
        //imageView?.contentMode = .top
        imageView?.semanticContentAttribute = .forceLeftToRight
        imageView?.contentMode = .scaleAspectFill
        
    }
    
    private func setImageViewConstraints(){
        let safeArea = self.safeAreaLayoutGuide
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        imageView?.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
        imageView?.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.55).isActive = true
    }
}

