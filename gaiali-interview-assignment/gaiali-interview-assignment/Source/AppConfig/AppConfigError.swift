//
//  AppConfigError.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

enum AppConfigError: LocalizedError {
    case environmentVarNotDefined
    case readingConfigFailed(for: String)
    
    var errorDescription: String? {
        switch self {
        case .environmentVarNotDefined:
            return "Environment variable is not defined in Info.plist"
        case let .readingConfigFailed(fileName):
            return "Can't find config file named: \(fileName)"
        }
    }
}
