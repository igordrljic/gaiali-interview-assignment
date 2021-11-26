//
//  KeyedDecodingContainer.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

extension KeyedDecodingContainer {
    
    func decode(_ type: URL.Type, forKey key: K) throws -> URL {
        let string = try decode(String.self, forKey: key)
        guard let path = string.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
              let url = URL(string: path)
        else {
            throw DecodingError.dataCorrupted(
                .init(codingPath: codingPath,
                      debugDescription: "The string value for the key \(key) couldn't be converted into a URL: \(string)")
            )
        }
        return url
    }
    
    // decoding an optional URL
    func decodeIfPresent(_ type: URL.Type, forKey key: K) throws -> URL? {
        guard let path = try decode(String.self, forKey: key).addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        else {
            return nil
        }
        return URL(string: path)
    }
}
