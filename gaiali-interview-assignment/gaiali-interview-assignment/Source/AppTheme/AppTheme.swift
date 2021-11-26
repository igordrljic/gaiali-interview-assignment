//
//  AppTheme.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import UIKit

protocol AppTheme {
    var primaryColor: UIColor { get }
    var primaryInvertColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var primaryText: UIColor { get }
    var secondaryText: UIColor { get }
    var primaryTextInvertColor: UIColor { get }
    var primaryFont: UIFont { get }
    var secondaryFont: UIFont { get }
}
