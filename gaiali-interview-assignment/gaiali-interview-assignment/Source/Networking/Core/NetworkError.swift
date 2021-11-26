//
//  NetworkError.swift
//
//  Created by Igor Drljic on 8.11.21..
//

import Foundation

enum NetworkError: Error {
    case unknown
    case responseError(code: Int, data: Data?)
    case noHTTPMethodSet(request: URLRequest)
    case noURL(request: URLRequest)
    case jsonEncodingFailed(error: Error)
    case responseParsingFailed(error: Error)
    case responseContainsNoData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Something went wrong"
        case let .responseError(code, data):
            if let data = data, let info = String(data: data, encoding: .utf8) {
                return "Invalid response with code: \(code) data: \(info)"
            } else {
                return "Invalid response with code: \(code)"
            }
        case let .noHTTPMethodSet(request):
            return "No HTTP method set for request: \(request)"
        case let .noURL(request):
            return "No URL for request: \(request)"
        case let .jsonEncodingFailed(error):
            return "JSON encoding failed with error: \(error)"
        case let .responseParsingFailed(error):
            return "Response parsing failed with error: \(error)"
        case .responseContainsNoData:
            return "Response contains no data"
        }
    }
}
