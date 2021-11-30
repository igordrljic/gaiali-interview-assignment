//
//  ForecastWebProvider.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

class ForecastWebProvider: ForecastProvider {
    private let webservice: WeatherWebservice
    private let network: Network
    
    init(webservice: WeatherWebservice = WeatherWebservice.shared,
         network: Network = Network.shared) {
        self.webservice = webservice
        self.network = network
    }
    
    func getForecast(for city: String,
                     units: Units,
                     completion: @escaping (Result<[Forecast], Error>) -> Void) {
        let request = webservice.forecastRequest(for: city, units: units)
        network.run(request) { (result: Result<ForecastResponse, Error>) in
            switch result {
            case let .success(response):
                completion(.success(response.list))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
