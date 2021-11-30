//
//  ForecastLocalProvider.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 29.11.21..
//

import Foundation

class ForecastLocalProvider: ForecastProvider {
    private let forecast: [String: [Forecast]]
    
    init(forecast: [String: [Forecast]]) {
        self.forecast = forecast
    }
    
    func getForecast(for city: String,
                     units: Units,
                     completion: @escaping (Result<[Forecast], Error>) -> Void) {
        if let forecast = forecast[ForecastLocalProvider.keyFor(city: city, units: units)] {
            completion(.success(forecast))
        } else {
            completion(.success([]))
        }
    }
    
    static func keyFor(city: String, units: Units) -> String {
        "\(city)-\(units.rawValue)"
    }
}
