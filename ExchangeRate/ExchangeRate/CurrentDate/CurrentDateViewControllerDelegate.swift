//
//  CurrentDateViewControllerDelegate.swift
//  ExchangeRate
//
//  Created by Anastasia on 29.10.2022.
//

import UIKit

extension CurrentDateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.collectionModelData.map{$0.currency}.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CurrentDateTableViewCell else { return UITableViewCell() }
//        cell.setData(model.collectionModelData[indexPath.row])
        cell.textLabel?.text = model.collectionModelData.map{$0.currency}[indexPath.row]
        cell.value(forKey: model.collectionModelData.map{$0.currency}[indexPath.item])
        return cell
    }
    
}
