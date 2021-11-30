//
//  ForecastCollectionCell.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 30.11.21..
//

import UIKit

struct ForecastCollectionCellModel {
    let temperature: String
    let time: String
    let icon: String?
}

class ForecastCollectionCell: BaseCollectionCell {
    let temp = UILabel().autolayoutView
    let time = UILabel().autolayoutView
    private let padding: CGFloat = 10
    
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
    }
    
    func setViews() {        
        contentView.addSubview(temp)
        contentView.addSubview(time)
    }
    
    func setConstraints() {
        [time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
         time.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
         time.trailingAnchor.constraint(equalTo: temp.leadingAnchor, constant: -padding),
         time.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
         temp.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
         temp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
         temp.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)]
            .forEach { $0.isActive = true }
        temp.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        time.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}
