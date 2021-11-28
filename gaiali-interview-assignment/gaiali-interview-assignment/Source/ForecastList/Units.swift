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
