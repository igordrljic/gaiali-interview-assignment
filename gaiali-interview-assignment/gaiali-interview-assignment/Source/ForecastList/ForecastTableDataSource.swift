//
//  ForecastTableDataSource.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import UIKit

class ForecastTableDataSource: NSObject, UITableViewDataSource {
    var sectionTitles = [String]()
    var cellViewModels = [[ForecastCellViewModel]]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellViewModels[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastCell.reuseIdentifier) as? ForecastCell
        else { fatalError("Can't dequeue cell with reuse identifier: \(ForecastCell.reuseIdentifier)") }
        cell.configure(with: cellViewModels[indexPath.section][indexPath.row])
        return cell
    }
}
