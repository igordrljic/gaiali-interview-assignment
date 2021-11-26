//
//  ResponseDecoding.swift
//
//  Created by Igor Drljic on 7/1/21.
//

import Foundation

protocol ResponseDecoding {
    func decode<ResultType: Decodable>(_ data: Data) throws -> ResultType
}
