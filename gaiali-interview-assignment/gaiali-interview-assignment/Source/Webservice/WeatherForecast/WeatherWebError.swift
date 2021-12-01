//
//  WeatherWebError.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 1.12.21..
//

import Foundation

struct WeatherWebError: LocalizedError, Decodable {
    let code: String
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "cod", message
    }
    
    var errorDescription: String? {
        switch code {
        case "404":
            return Strings.WeatherWebError.cityNotfound
        default:
            return Strings.PresentableError.general
        }
    }
}
