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
    
    
    @IBOutlet weak var welcomeView: UIView?
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var welcomeLabel: UILabel?
    @IBOutlet weak var startButton: UIButton?
    
    
    
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
    
    public func welcomeViewSetup() {
        welcomeViewConstraints()
        setImageView()
        setImageViewConstraints()
        setLabel()
        setLabelConstraints()
        setStartButtonTitleSettings()
        setStartButtonConstraints()
    }
    
    //MARK: -
    //MARK: Private Methods (CurrentDateView)
    
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
        tableView?.register(CurrentDateTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView?.reloadData()
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
    
    //MARK: -
    //MARK: Private Methods (welcomeView)
    
    private func welcomeViewConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        welcomeView?.translatesAutoresizingMaskIntoConstraints = false
        welcomeView?.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.9).isActive = true
        welcomeView?.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.9).isActive = true
        welcomeView?.backgroundColor = Colors.shared.exchangeYellow
        welcomeView?.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        welcomeView?.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
    }
    
    private func setImageView() {
        let exchangeImage = UIImage(named: "1")
        imageView?.image = exchangeImage
        imageView?.semanticContentAttribute = .forceLeftToRight
        imageView?.contentMode = .scaleAspectFill
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
    
    private func setStartButtonTitleSettings() {
        startButton?.setTitle("START", for: .normal)
        startButton?.titleLabel?.textAlignment = .center
        startButton?.contentMode = .center
    }
    
    private func setImageViewConstraints() {
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        guard let welcomeViewTop = welcomeView?.topAnchor else { return }
        imageView?.topAnchor.constraint(equalTo: welcomeViewTop).isActive = true
        guard let welcomeViewWidth = welcomeView?.widthAnchor else { return }
        imageView?.widthAnchor.constraint(equalTo: welcomeViewWidth).isActive = true
        guard let welcomeViewHeight = welcomeView?.heightAnchor else { return }
        imageView?.heightAnchor.constraint(equalTo: welcomeViewHeight, multiplier: 0.55).isActive = true
    }
    
    private func setLabelConstraints() {
        welcomeLabel?.translatesAutoresizingMaskIntoConstraints = false
        guard let imageBottom = imageView?.bottomAnchor else { return }
        welcomeLabel?.topAnchor.constraint(equalTo: imageBottom, constant: 20).isActive = true
        guard let welcomeViewLeading = welcomeView?.leadingAnchor else { return }
        welcomeLabel?.leadingAnchor.constraint(equalTo: welcomeViewLeading, constant: 15).isActive = true
        guard let welcomeViewTrailing = welcomeView?.trailingAnchor else { return }
        welcomeLabel?.trailingAnchor.constraint(equalTo: welcomeViewTrailing, constant: -15).isActive = true
    }
    
    private func setStartButtonConstraints() {
        startButton?.translatesAutoresizingMaskIntoConstraints = false
        guard let labelBottom = welcomeLabel?.bottomAnchor else { return }
        startButton?.topAnchor.constraint(equalTo: labelBottom, constant: 15).isActive = true
        guard let welcomeViewBottom = welcomeView?.bottomAnchor else { return }
        startButton?.bottomAnchor.constraint(equalTo: welcomeViewBottom, constant: -15).isActive = true
        guard let welcomeViewLeading = welcomeView?.leadingAnchor else { return }
        startButton?.leadingAnchor.constraint(equalTo: welcomeViewLeading, constant: 15).isActive = true
        guard let welcomeViewTrailing = welcomeView?.trailingAnchor else { return }
        startButton?.trailingAnchor.constraint(equalTo: welcomeViewTrailing, constant: -15).isActive = true
    }
    
}
