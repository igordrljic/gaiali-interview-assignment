//
//  ForecastTableDataSource.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import UIKit

class ForecastTableDataSource: NSObject, UITableViewDataSource {
    var sectionTitles = [String]()
    var cellViewModels = [ForecastHourListViewModel]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableCell.reuseIdentifier) as? ForecastTableCell
        else { fatalError("Can't dequeue cell with reuse identifier: \(ForecastTableCell.reuseIdentifier)") }
        cell.configure(with: cellViewModels[indexPath.section])
        return cell
    }
}
