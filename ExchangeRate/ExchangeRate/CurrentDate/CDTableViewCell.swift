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
    
    private var currencyLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var valueLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var model = CurrentDateModel()
    
    // MARK: -
    // MARK: Public Methods
    
    public func setData(_ data: CurrentDateData) {
        currencyLabel.text = data.currency
        currencyLabel.backgroundColor = .blue
        valueLabel.text = String(data.saleRateNB)
        valueLabel.backgroundColor = .green
        setConstraints()
        self.contentView.backgroundColor = .brown
    }
    
    // MARK: -
    // MARK: Private Methods
    
    private func setConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        currencyLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        currencyLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        currencyLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.1).isActive = true
        currencyLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5).isActive = true
        
        valueLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        valueLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.1).isActive = true
        valueLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5).isActive = true
        
        let currencyLabelTrailing = self.currencyLabel.trailingAnchor
        let valueLabelLeading = self.valueLabel.leadingAnchor
        
        currencyLabel.trailingAnchor.constraint(equalTo: valueLabelLeading).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: currencyLabelTrailing).isActive = true
    }
    
}
