//
//  CDTableViewCell.swift
//  ExchangeRate
//
//  Created by Anastasia on 29.10.2022.
//

import UIKit

class CurrentDateTableViewCell: UITableViewCell {
    
    // MARK: -
    // MARK: Properties
    
    public var labelStack: UIStackView? = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        var currencyLabel: UILabel? = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = Fonts.shared.regular
            label.textColor = .black
            label.backgroundColor = .brown
            label.numberOfLines = 1
            return label
        }()
        var valueLabel: UILabel? = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = Fonts.shared.regular
            label.textColor = .black
            label.backgroundColor = .green
            label.numberOfLines = 1
            return label
        }()
        return stack
    }()
    
    
//    public var currencyLabel: UILabel? = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.font = Fonts.shared.regular
//        label.textColor = .black
//        label.backgroundColor = .brown
//        label.numberOfLines = 1
//        return label
//    }()
//    public var valueLabel: UILabel? = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.font = Fonts.shared.regular
//        label.textColor = .black
//        label.backgroundColor = .green
//        label.numberOfLines = 1
//        return label
//    }()
    
    private var model = CurrentDateModel()
    private var data: CurrentDateData?
    
    // MARK: -
    // MARK: Public Methods
    
    public func setData(_ data: CurrentDateData) {
        self.contentView.contentMode = .center
//        self.contentView.safeAreaLayoutGuide
//        self.contentView.addSubview(currencyLabel!)
//        self.contentView.addSubview(valueLabel!)
        self.contentView.addSubview(labelStack ?? UIStackView())
        print(self.contentView.subviews)
//        currencyLabel?.text = data.currency
//        valueLabel?.text = String(data.saleRateNB)
        self.data = data
        setConstraints()
        self.backgroundColor = .blue
    }
    
    // MARK: -
    // MARK: Private Methods
    
    private func setConstraints() {
        let safeArea = self.contentView.safeAreaLayoutGuide
        self.contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        labelStack?.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        labelStack?.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        labelStack?.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        labelStack?.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
    }
    
}
