//
//  FileError.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

enum FileError: LocalizedError {
    case fileNotFoundFor(fileName: String)
    case readingFileFailed(fileName: String)
    
    var errorDescription: String? {
        switch self {
        case let .fileNotFoundFor(fileName):
            return Strings.FileError.fileNotFoundFor(fileName)
        case let .readingFileFailed(fileName):
            return Strings.FileError.readingFileFailed(fileName)
        }
    }
}
