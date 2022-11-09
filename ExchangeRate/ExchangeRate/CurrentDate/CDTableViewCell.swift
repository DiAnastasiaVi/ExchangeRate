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
    
//    private var currencyLabel: UILabel = {
//        let label = UILabel(frame: CGRect.zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    private var valueLabel: UILabel = {
//        let label = UILabel(frame: CGRect.zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    
    @IBOutlet weak var labelStack: UIStackView?
    @IBOutlet weak var currencyLabel: UILabel?
    @IBOutlet weak var valueLabel: UILabel?
    
    private var model = CurrentDateModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setConstraints()
    }
    
    // MARK: -
    // MARK: Public Methods
    
//    public func setData(_ data: CurrentDateData) {
//        currencyLabel?.text = data.currency
//        currencyLabel?.backgroundColor = .blue
//        valueLabel?.text = String(data.saleRateNB)
//        valueLabel?.backgroundColor = .green
//        setConstraints()
//    }
    
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
