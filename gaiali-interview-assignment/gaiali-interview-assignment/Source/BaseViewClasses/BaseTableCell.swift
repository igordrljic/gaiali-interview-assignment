//
//  BaseTableCell.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import UIKit

class BaseTableCell: UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    var appTheme: AppTheme {
        AppThemeManager.shared.theme
    }
}
