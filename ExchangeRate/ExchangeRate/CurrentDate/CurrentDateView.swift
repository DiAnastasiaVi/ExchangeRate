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
    private var cellId = "cell"
    
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
        let calendar = Calendar(identifier: .gregorian)
        var components = DateComponents()
        components.year = -4
        let minDate = calendar.date(byAdding: components, to: Date())
        datePicker?.minimumDate = minDate
        datePicker?.maximumDate = .now
    }
    
    private func datePickerConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        datePicker?.translatesAutoresizingMaskIntoConstraints = false
        datePicker?.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15).isActive = true
        datePicker?.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
    }
    
    private func tableViewSettings() {
//        let tableDataView = UITableView(frame: CGRect(x: 50, y: 50, width: 150, height: 180), style: .grouped)
//        self.tableView = tableDataView
//        self.addSubview(tableDataView)
//        tableDataView.register(CurrentDateTableViewCell.self, forCellReuseIdentifier: cellId)
//        tableDataView.translatesAutoresizingMaskIntoConstraints = false
        tableView?.register(CurrentDateTableViewCell.self, forCellReuseIdentifier: cellId)
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
