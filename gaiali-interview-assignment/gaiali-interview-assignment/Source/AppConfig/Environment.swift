//
//  Environment.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

enum Environment: String, CaseIterable {
    case debug
    case release
    
    static func read() -> Self {
        guard let environmentString = Bundle.main.infoDictionary?["Environment"] as? String,
              let environment = Environment(rawValue: environmentString) else {
            fatalError(String(describing: AppConfigError.environmentVarNotDefined))
        }
        return environment
    }
}
