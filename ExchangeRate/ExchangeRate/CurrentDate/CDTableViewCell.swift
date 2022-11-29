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
    
    public var currencyLabel: UILabel? = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Fonts.shared.regular
        label.textColor = .black
//        label.backgroundColor = Colors.shared.iconOrange
        label.numberOfLines = 1
        return label
    }()
    public var valueLabel: UILabel? = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Fonts.shared.regular
        label.textColor = .black
//        label.backgroundColor = Colors.shared.iconOrange
        label.numberOfLines = 1
        return label
    }()
    
    private var model = CurrentDateModel()
    private var data: CurrentDateData?
    
    // MARK: -
    // MARK: Public Methods
    
    public func setData(_ data: CurrentDateData) {
        self.contentView.contentMode = .center
        self.contentView.addSubview(currencyLabel!)
        self.contentView.addSubview(valueLabel!)
        currencyLabel?.text = data.currency
        valueLabel?.text = String(data.saleRateNB)
        self.data = data
        setConstraints()
//        self.backgroundColor = Colors.shared.iconOrange
    }
    
    // MARK: -
    // MARK: Private Methods
    
    private func setConstraints() {
        let safeArea = self.contentView.safeAreaLayoutGuide
        self.contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        currencyLabel?.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        currencyLabel?.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        currencyLabel?.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        guard let trailing = valueLabel?.leadingAnchor else { return }
        currencyLabel?.trailingAnchor.constraint(equalTo: trailing).isActive = true
        currencyLabel?.heightAnchor.constraint(equalTo: safeArea.heightAnchor).isActive = true
        currencyLabel?.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5).isActive = true
        valueLabel?.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        valueLabel?.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        valueLabel?.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        guard let leading = currencyLabel?.trailingAnchor else { return }
        valueLabel?.leadingAnchor.constraint(equalTo: leading).isActive = true
        valueLabel?.heightAnchor.constraint(equalTo: safeArea.heightAnchor).isActive = true
        valueLabel?.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5).isActive = true
    }
    
}
