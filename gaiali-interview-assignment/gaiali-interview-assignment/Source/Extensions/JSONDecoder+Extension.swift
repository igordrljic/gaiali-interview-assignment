//
//  JSONDecoder.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

extension JSONDecoder {
    
    static var defaultDateDecodingStrategy: JSONDecoder.DateDecodingStrategy {
        .secondsSince1970
    }
}
