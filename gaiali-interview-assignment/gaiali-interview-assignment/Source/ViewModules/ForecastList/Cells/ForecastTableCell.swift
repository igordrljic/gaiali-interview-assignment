//
//  ForecastCell.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import UIKit

class ForecastTableCell: BaseTableCell {
    private (set) var collection: IntrinsicSizeCollectionView!
    private let collectionLayout = UICollectionViewFlowLayout()
    private let height: CGFloat = UIScreen.main.bounds.width / 2
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ForecastHourListViewModel) {
        collection.dataSource = viewModel.forecastCollectionDataSource
        collection.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cellSize = CGSize(width: contentView.bounds.width, height: height)
        collection.height = cellSize.height
        collectionLayout.itemSize = cellSize
    }
    
    func setViews() {
        let cellSize = CGSize(width: contentView.bounds.width, height: height)
        
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.itemSize = cellSize
        collectionLayout.minimumLineSpacing = 0
        collectionLayout.minimumInteritemSpacing = 0
        
        collection = IntrinsicSizeCollectionView(frame: CGRect(origin: .zero, size: cellSize),
                                                 collectionViewLayout: collectionLayout).autolayoutView
        collection.register(ForecastCollectionCell.self, forCellWithReuseIdentifier: ForecastCollectionCell.reuseIdentifier)
        collection.isPagingEnabled = true
        collection.bounces = true
        collection.setCollectionViewLayout(collectionLayout, animated: false)
        collection.backgroundColor = appTheme.backgroundColor
        contentView.addSubview(collection)
    }
    
    func setConstraints() {
        [collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
         collection.topAnchor.constraint(equalTo: contentView.topAnchor),
         collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
         collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)]
            .forEach { $0.isActive = true }
    }
}
