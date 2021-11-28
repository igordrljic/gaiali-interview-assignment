//
//  ForecastMain.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

struct ForecastMain: Decodable {
    var temp: Float
    let feelsLike: Float
    let tempMin: Float
    let tempMax: Float
    let pressure: Float
    let seaLevel: Float
    let grndLevel: Float
    let humidity: Float
    let tempKf: Float
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}
