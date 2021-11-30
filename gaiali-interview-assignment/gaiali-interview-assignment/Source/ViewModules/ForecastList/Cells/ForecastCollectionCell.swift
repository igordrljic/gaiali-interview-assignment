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
    
    func configure(with model: ForecastCollectionCellModel) {
        time.text = model.time
        temp.text = model.temperature
        iconView.setImage(with: model.iconUrl, placeholder: model.iconPlaceholder)
    }
    
    func setViews() {
        iconView.contentMode = .scaleAspectFit
        contentView.addSubview(iconView)
        
        temp.font = appTheme.primaryFont.withSize(32)
        contentView.addSubview(temp)
        contentView.addSubview(time)
    }
    
    func setConstraints() {
        [iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
         iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
         iconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
         iconView.trailingAnchor.constraint(lessThanOrEqualTo: time.leadingAnchor, constant: -padding),
         iconView.trailingAnchor.constraint(lessThanOrEqualTo: temp.leadingAnchor, constant: -padding),
         temp.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
         temp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
         temp.bottomAnchor.constraint(equalTo: time.topAnchor, constant: -padding),
         time.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
         time.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -padding)]
            .forEach { $0.isActive = true }
        iconView.setApectRatioConstraint(1)
    }
}
