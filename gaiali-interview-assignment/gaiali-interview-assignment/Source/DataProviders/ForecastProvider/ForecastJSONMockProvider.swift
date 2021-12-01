//
//  ForecastJSONMockProvider.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

class ForecastJSONMockProvider: ForecastProvider {
    private let jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        jsonDecoder.dateDecodingStrategy = JSONDecoder.defaultDateDecodingStrategy
    }
    
    func getForecast(for city: String,
                     units: Units,
                     completion: @escaping (Result<[Forecast], Error>) -> Void) {
        completion(readJSON(file: "\(city)-\(units.rawValue)"))
    }
    
    private func readJSON(file fileName: String) -> Result<[Forecast], Error> {
        do {
            guard let fileUrl = Bundle(for: ForecastJSONMockProvider.self).url(forResource: fileName, withExtension: "json")
            else { throw FileError.fileNotFoundFor(fileName: "\(fileName).json") }
            let data = try Data(contentsOf: fileUrl)
            let forecast = try jsonDecoder.decode(ForecastResponse.self, from: data)
            return .success(forecast.list)
        } catch {
            return .failure(error)
        }
    }
}
