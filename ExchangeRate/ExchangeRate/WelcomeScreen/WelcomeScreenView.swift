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
    @IBOutlet weak var welcomeLabel: UILabel?
    
    // MARK: -
    // MARK: Public Methods
    
    public func commonSetup() {
        setImageView()
        setImageViewConstraints()
        setLabel()
        setLabelConstraints()
    }
    
    // MARK: -
    // MARK: Private Methods
    
    private func setImageView() {
        let exchangeImage = UIImage(named: "1")
        imageView?.image = exchangeImage
        imageView?.semanticContentAttribute = .forceLeftToRight
        imageView?.contentMode = .scaleAspectFill
    }
    
    private func setImageViewConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        imageView?.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
        imageView?.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setLabel() {
        welcomeLabel?.text = """
                              Хммм...
                              Який курс був тиждень тому? Хто б знав...
                              Ми знаємо! Оберіть дату, що вас цікавить, і курс валют з'явиться на екрані.
                              Дякуємо, що ви з нами!
                             """
        welcomeLabel?.textAlignment = .center
        welcomeLabel?.numberOfLines = 5
        welcomeLabel?.contentMode = .center
        //welcomeLabel?.contentMode = .scaleAspectFill
    }
    
    private func setLabelConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        welcomeLabel?.translatesAutoresizingMaskIntoConstraints = false
        guard let imageBottom = imageView?.bottomAnchor else { return }
        welcomeLabel?.topAnchor.constraint(equalTo: imageBottom, constant: 10).isActive = true
        welcomeLabel?.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
        guard let imageHeight = imageView?.heightAnchor else { return }
        welcomeLabel?.heightAnchor.constraint(equalTo: imageHeight, multiplier: 0.3).isActive = true
    }
}

