//
//  ForecastResponse.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

struct ForecastResponse: Decodable {
    let list: [Forecast]
}
