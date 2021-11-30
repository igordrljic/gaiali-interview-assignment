//
//  BaseCollectionCell.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 29.11.21..
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    var appTheme: AppTheme {
        AppThemeManager.shared.theme
    }
}
