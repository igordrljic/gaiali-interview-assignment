//
//  BaseCollectionView.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 30.11.21..
//

import Foundation
import UIKit

class BaseCollectionView: UICollectionView {
    var appTheme: AppTheme {
        AppThemeManager.shared.theme
    }
}
