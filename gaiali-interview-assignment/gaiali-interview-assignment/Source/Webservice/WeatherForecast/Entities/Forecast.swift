//
//  Forecast.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

struct Forecast: Decodable {
    let dt: Date
    let main: ForecastMain
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
}
