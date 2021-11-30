//
//  HourForecastCollectionDataSource.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 30.11.21..
//

import Foundation
import UIKit

class ForecastHourCollectionDataSource: NSObject, UICollectionViewDataSource {
    var cellViewModels: [ForecastCollectionCellModel] = []
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionCell.reuseIdentifier,
                                                            for: indexPath) as? ForecastCollectionCell
        else {
            fatalError("Can't dequeue cell for identifier: \(ForecastTableCell.reuseIdentifier)")
        }
        cell.configure(with: cellViewModels[indexPath.item])
        return cell
    }
}
