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
    
    init(baseUrl: URL = AppConfig.shared.weatherForecastBaseURL,
         decoding: ResponseDecoding = JSONDecoding(dateDecodingStrategy: JSONDecoder.defaultDateDecodingStrategy)) {
        self.baseUrl = baseUrl
        self.decoding = decoding
    }
}

extension WeatherWebservice {
    
    func forecastRequest(for city: String, count: Int) -> Request {
        Request(url: self.baseUrl.appendingPathComponent("/forecast"),
                httpMethod: .get,
                parameters: ["q": city, "appid": AppConfig.shared.weatherApiKey, "cnt": count],
                encoding: URLEncoding(),
                decoding: self.decoding)
    }
}
