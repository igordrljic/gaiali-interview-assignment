//
//  ForecastCollectionCell.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 30.11.21..
//

import UIKit

class ForecastCollectionCell: BaseCollectionCell {
    let temp = UILabel().autolayoutView
    let time = UILabel().autolayoutView
    let iconView = UIImageView().autolayoutView
    private let padding: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ForecastCollectionCellModel) {
        time.text = viewModel.time
        temp.text = viewModel.temperature
        iconView.image = viewModel.iconPlaceholder
    }
    
    func setViews() {
        iconView.contentMode = .scaleAspectFit
        contentView.addSubview(iconView)
        contentView.addSubview(temp)
        contentView.addSubview(time)
    }
    
    func setConstraints() {
        [iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
         iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
         iconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
         iconView.trailingAnchor.constraint(lessThanOrEqualTo: time.leadingAnchor, constant: -padding),
         iconView.trailingAnchor.constraint(lessThanOrEqualTo: temp.leadingAnchor, constant: -padding),
         time.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
         time.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
         time.bottomAnchor.constraint(equalTo: temp.topAnchor, constant: -padding),
         temp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
         temp.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -padding)]
            .forEach { $0.isActive = true }
        iconView.setApectRatioConstraint(1)
    }
}
