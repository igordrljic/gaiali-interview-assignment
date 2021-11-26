//
//  JsonDecoding.swift
//
//  Created by Igor Drljic on 7/1/21.
//

import Foundation

class JSONDecoding: ResponseDecoding {
    private let jsonDecoder: JSONDecoder

    init(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .iso8601) {
        jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = dateDecodingStrategy
    }
    
    func decode<ResultType: Decodable>(_ data: Data) throws -> ResultType {
        return try jsonDecoder.decode(ResultType.self, from: data)
    }
}
