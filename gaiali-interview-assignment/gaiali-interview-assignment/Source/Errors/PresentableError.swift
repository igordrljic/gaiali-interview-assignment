//
//  PresentableError.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

enum PresentableError: LocalizedError {
    case general
    
    var errorDescription: String? {
        switch self {
        case .general:
            return Strings.PresentableError.general
        }
    }
}
