//
//  MainScreenView.swift
//  ExchangeRate
//
//  Created by Anastasia on 03.08.2022.
//

import UIKit

class WelcomeScreenView: UIView {
    
    //MARK: -
    //MARK: Properties
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var welcomeLabel: UILabel?
    @IBOutlet weak var startButton: UIButton?
    
    // MARK: -
    // MARK: Public Methods
    
    public func commonSetup() {
        setImageView()
        setImageViewConstraints()
        setLabel()
        setLabelConstraints()
        setStartButtonTitleSettings()
        setStartButtonConstraints()
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
        imageView?.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.55).isActive = true
    }
    
    private func setLabel() {
        welcomeLabel?.text = """
                              Хммм...
                              Який курс був тиждень тому? Хто б знав...
                              Ми знаємо! Оберіть дату, що вас цікавить, і курс валют з'явиться на екрані.
                              Дякуємо, що ви з нами!
                             """
        welcomeLabel?.textAlignment = .center
        welcomeLabel?.numberOfLines = 7
        welcomeLabel?.contentMode = .center
        welcomeLabel?.font = Fonts.shared.regular
    }
    
    private func setLabelConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        welcomeLabel?.translatesAutoresizingMaskIntoConstraints = false
        guard let imageBottom = imageView?.bottomAnchor else { return }
        welcomeLabel?.topAnchor.constraint(equalTo: imageBottom, constant: 20).isActive = true
        welcomeLabel?.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15).isActive = true
        welcomeLabel?.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15).isActive = true
    }
    
    private func setStartButtonTitleSettings() {
        startButton?.setTitle("Start", for: .normal)
        startButton?.setTitleColor(.black, for: .normal)
        startButton?.titleLabel?.textAlignment = .center
        startButton?.contentMode = .center
    }
    
    private func setStartButtonConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        startButton?.translatesAutoresizingMaskIntoConstraints = false
        guard let labelBottom = welcomeLabel?.bottomAnchor else { return }
        startButton?.topAnchor.constraint(equalTo: labelBottom, constant: 15).isActive = true
        startButton?.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -15).isActive = true
        startButton?.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15).isActive = true
        startButton?.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15).isActive = true
    }
}

