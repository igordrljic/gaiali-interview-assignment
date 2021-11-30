//
//  ForecastHourListViewModel.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 30.11.21..
//

import Foundation
import UIKit

class ForecastHourListViewModel {
    let forecastCollectionDataSource = ForecastHourCollectionDataSource()
    private let forecastProvider: ForecastProvider
    private let city: String
    private let units: Units
    
    init(forecastProvider: ForecastProvider, city: String, units: Units) {
        self.forecastProvider = forecastProvider
        self.city = city
        self.units = units
    }
    
    func load(completion: @escaping (Result<Void, Error>) -> Void) {
        forecastProvider.getForecast(for: city, units: units) { response in
            switch response {
            case let .success(forecast):
                self.fillCellViewModels(with: forecast)
                completion(.success(()))
            case let .failure(error):
                self.fillCellViewModels(with: [])
                completion(.failure(error))
            }
        }
    }
    
    private func fillCellViewModels(with forecasts: [Forecast]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        forecastCollectionDataSource.cellViewModels = forecasts.map({ hourForecast in
            ForecastCollectionCellModel(temperature: "\(Int(hourForecast.main.temp.rounded()))\(units.tempUnit)",
                                        time: dateFormatter.string(from: hourForecast.dt),
                                        iconPlaceholder: UIImage(systemName: "photo")!,
                                        icon: hourForecast.weather.first?.iconUrl)
        })
    }
}
