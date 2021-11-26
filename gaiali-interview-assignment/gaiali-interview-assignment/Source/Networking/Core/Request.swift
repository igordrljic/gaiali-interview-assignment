//
//  Request.swift
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

typealias HTTPHeader = [String: String]
typealias Parameters = [String: Any]

struct Request: Identifiable {
    let id = UUID()
    let url: URL
    let httpMethod: HTTPMethod
    let httpHeader: HTTPHeader
    let parameters: Parameters?
    let encoding: ParameterEncoding?
    let decoding: ResponseDecoding
    
    init(url: URL,
         httpMethod: HTTPMethod,
         httpHeader: HTTPHeader = [:],
         parameters: Parameters? = nil,
         encoding: ParameterEncoding? = nil,
         decoding: ResponseDecoding) {
        self.url = url
        self.httpMethod = httpMethod
        self.httpHeader = httpHeader
        self.parameters = parameters
        self.encoding = encoding
        self.decoding = decoding
    }
}

extension Request: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Request: Equatable {
    static func == (lhs: Request, rhs: Request) -> Bool {
        lhs.id == rhs.id
    }
}

extension Request {
    func urlRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = httpHeader
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        if let parameters = parameters, let encoding = encoding {
            return try encoding.encode(urlRequest, with: parameters)
        } else {
            return urlRequest
        }
    }
}
