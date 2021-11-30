//
//  ForecastHourList.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 29.11.21..
//

import Foundation
import UIKit

class ForecastHourListViewController: BaseViewController {
    var viewModel: ForecastHourListViewModel!
    let collection = UICollectionView().autolayoutView
    private let collectionLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionLayout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        showActivityIndicator()
        viewModel.load { _ in
            self.collection.reloadData()
            self.hideActivityIndicator()
        }
    }
    
    override func setViews() {
        super.setViews()
        
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        collectionLayout.minimumLineSpacing = 0
        collectionLayout.minimumInteritemSpacing = 0
        
        collection.isPagingEnabled = true
        collection.bounces = true
        collection.setCollectionViewLayout(collectionLayout, animated: false)
        collection.dataSource = viewModel.forecastCollectionDataSource
        view.addSubview(collection)
    }
    
    override func setConstraints() {
        super.setConstraints()
        [collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         collection.topAnchor.constraint(equalTo: view.topAnchor),
         collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
            .forEach { $0.isActive = true }
    }
}
