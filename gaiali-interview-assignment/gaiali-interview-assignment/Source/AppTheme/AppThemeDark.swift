//
//  AppThemeDark.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import UIKit

class AppThemeDark: AppTheme {
    var primaryColor: UIColor { .systemBlue }
    var primaryInvertColor: UIColor { .white }
    var backgroundColor: UIColor { .black }
    var primaryText: UIColor { .lightText }
    var secondaryText: UIColor { .placeholderText }
    var primaryTextInvertColor: UIColor { .darkText }
    var primaryFont: UIFont { UIFont.systemFont(ofSize: 17) }
    var secondaryFont: UIFont { UIFont.systemFont(ofSize: 13) }
}
