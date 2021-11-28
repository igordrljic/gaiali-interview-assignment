//
//  ForecastCell.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import UIKit

class ForecastCell: BaseTableCell {
    let temp = UILabel().autolayoutView
    let time = UILabel().autolayoutView
    private let padding: CGFloat = 10
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ForecastCellViewModel) {
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
