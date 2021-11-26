//
//  FileError.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

enum FileError: LocalizedError {
    case fileNotFoundFor(fileName: String)
    
    var errorDescription: String? {
        switch self {
        case let .fileNotFoundFor(fileName):
            return "File with name: \(fileName) is not found."
        }
    }
}

extension FileError: PresentableErrorConvertible {
    func convertToPresentable() -> PresentableError {
        .general
    }
}
