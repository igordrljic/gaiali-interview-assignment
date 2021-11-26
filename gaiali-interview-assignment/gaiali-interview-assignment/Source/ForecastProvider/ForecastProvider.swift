//
//  ForecastProvider.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

protocol ForecastProvider {
    func getForecast(for city: String,
                     count: Int,
                     completion: @escaping (Result<ForecastResponse, Error>) -> Void)
}
