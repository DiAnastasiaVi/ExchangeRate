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
    
    internal var data: CurrentDateData?
    internal var cellId = "cell"
    
    private var label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
}
