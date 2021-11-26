//
//  AppThemeManager.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import UIKit

class AppThemeManager {
    static let shared = AppThemeManager()
    static var systemUserInterfaceStyle: UIUserInterfaceStyle {
        UIScreen.main.traitCollection.userInterfaceStyle
    }
    private (set) var theme: AppTheme
    
    private init() {
        switch AppThemeManager.systemUserInterfaceStyle {
        case .dark:
            theme = AppThemeDark()
        default:
            theme = AppThemeLight()
        }
    }
}
