//
//  Units.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import Foundation

enum Units: String {
    case standard
    case metric
    case imperial
}

extension Units {
    private static let defaultUnitsKey = "defaultUnitsKey"
    
    static var defaultValue: Units {
        get {
            guard let value = UserDefaults.standard.string(forKey: Units.defaultUnitsKey)
            else { return .metric }
            return Units(rawValue: value)!
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Units.defaultUnitsKey)
        }
    }
    
    var tempUnit: String {
        switch self {
        case .standard:
            return "K"
        case .metric:
            return "°C"
        case .imperial:
            return "°F"
        }
    }
}
