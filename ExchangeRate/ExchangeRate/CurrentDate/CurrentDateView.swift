//
//  CurrentDateView.swift
//  ExchangeRate
//
//  Created by Anastasia on 29.08.2022.
//

import UIKit

class CurrentDateView: UIView {
    
    //MARK: -
    //MARK: Properties
    
    @IBOutlet weak var datePicker: UIDatePicker?
    @IBOutlet weak var tableView: UITableView?
    
    // MARK: -
    // MARK: Public Methods
    public func commonSetup() {
        datePickerSettings()
        datePickerConstraints()
        tableViewSettings()
        tableViewConstraints()
    }
    
    //MARK: -
    //MARK: Private Methods
    
    private func datePickerSettings() {
        datePicker?.datePickerMode = .date
        datePicker?.maximumDate = .now
    }
    
    private func datePickerConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        datePicker?.translatesAutoresizingMaskIntoConstraints = false
        datePicker?.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15).isActive = true
        datePicker?.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
    }
    
    private func tableViewSettings() {
        tableView?.backgroundColor = .red
    }
    
    private func tableViewConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        guard let dateBottom = datePicker?.bottomAnchor else {return}
        tableView?.topAnchor.constraint(equalTo: dateBottom, constant: 15).isActive = true
        tableView?.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView?.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        tableView?.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
}
