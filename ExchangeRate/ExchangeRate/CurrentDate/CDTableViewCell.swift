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
    
    private var labelStack: UIStackView?
    public var currencyLabel: UILabel?
    public var valueLabel: UILabel?
    
    private var model = CurrentDateModel()
    private var data: CurrentDateData?
    
    // MARK: -
    // MARK: Public Methods
    
    public func setData(_ data: CurrentDateData) {
        currencyLabel?.text = data.currency
        currencyLabel?.backgroundColor = .blue
        valueLabel?.text = String(data.saleRateNB)
        self.data = data
        valueLabel?.backgroundColor = .green
        setConstraints()
        self.backgroundColor = .blue
    }
    
    // MARK: -
    // MARK: Private Methods
    
    private func setConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        labelStack?.translatesAutoresizingMaskIntoConstraints = false
        labelStack?.alignment = .center
        labelStack?.distribution = .equalCentering
        labelStack?.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30).isActive = true
        labelStack?.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        labelStack?.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        labelStack?.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        labelStack?.backgroundColor = .purple
    }
    
}
