//
//  AppThemeLight.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import UIKit

class AppThemeLight: AppTheme {
    var primaryColor: UIColor { .systemBlue }
    var primaryInvertColor: UIColor { .white }
    var backgroundColor: UIColor { .white }
    var primaryText: UIColor { .darkText }
    var secondaryText: UIColor { .placeholderText }
    var primaryTextInvertColor: UIColor { .lightText }
    var primaryFont: UIFont { UIFont.systemFont(ofSize: 17) }
    var secondaryFont: UIFont { UIFont.systemFont(ofSize: 13) }
}
