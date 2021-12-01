//
//  WeatherWebservice.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

class WeatherWebservice: Webservice {
    static let shared = WeatherWebservice()
    let baseUrl: URL
    let decoding: ResponseDecoding
    private let apiKey: String
    
    init(baseUrl: URL = AppConfig.shared.weatherForecastBaseURL,
         apiKey: String = AppConfig.shared.weatherApiKey,
         decoding: ResponseDecoding = JSONDecoding(dateDecodingStrategy: JSONDecoder.defaultDateDecodingStrategy)) {
        self.baseUrl = baseUrl
        self.apiKey = apiKey
        self.decoding = decoding
    }
}

extension WeatherWebservice {
    
    func forecastRequest(for city: String, units: Units) -> Request {
        Request(url: self.baseUrl.appendingPathComponent("/forecast"),
                httpMethod: .get,
                parameters: ["q": city, "appid": apiKey, "units": units.rawValue],
                encoding: URLEncoding(),
                decoding: self.decoding)
    }
}
