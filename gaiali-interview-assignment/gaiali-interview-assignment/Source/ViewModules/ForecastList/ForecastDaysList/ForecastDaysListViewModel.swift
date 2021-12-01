//
//  ForecastDaysListViewModel.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import UIKit

class ForecastDaysListViewModel {
    let forecastTableDataSource = ForecastDaysTableDataSource()
    private var forecastProvider: ForecastProvider
    private let units: Units
    
    init(forecastProvider: ForecastProvider, units: Units) {
        self.forecastProvider = forecastProvider
        self.units = units
    }
    
    func load(for city: String, completion: @escaping (Result<Void, Error>) -> Void) {
        forecastProvider.getForecast(for: city, units: units) { result in
            switch result {
            case let .success(forecast):
                self.update(with: forecast, for: city)
                completion(.success(()))
            case let .failure(error):
                self.clear()
                completion(.failure(error))
            }
        }
    }
    
    func clear() {
        forecastTableDataSource.sectionTitles = []
        forecastTableDataSource.cellViewModels = []
    }
    
    func setForecastProvider(for segment: ForecastDaysListViewController.Segment) {
        switch segment {
        case .web:
            self.forecastProvider = ForecastWebProvider()
        case .json:
            self.forecastProvider = ForecastJSONMockProvider()
        }
    }
    
    private func update(with forecast: [Forecast], for city: String) {
        let forecastByDay = divideByDay(forecast)
        fillSectionTitles(with: forecastByDay)
        fillCellViewModels(with: forecastByDay, for: city)
    }
    
    private func fillSectionTitles(with forecasts: [[Forecast]]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        forecastTableDataSource.sectionTitles = forecasts.map({
            dateFormatter.string(from: $0.first!.dt)
        })
    }
    
    private func fillCellViewModels(with forecasts: [[Forecast]], for city: String) {
        forecastTableDataSource.cellViewModels = forecasts.map({ forecastsForDay in
            ForecastHourListViewModel(forecasts: forecastsForDay, units: units)
        })
    }
    
    private func divideByDay(_ forecasts: [Forecast]) -> [[Forecast]] {
        guard !forecasts.isEmpty else {
            return [[]]
        }
        var input = forecasts
        var all = [[Forecast]]()
        var sameDay = [Forecast]()
        while true {
            sameDay.append(input.removeFirst())
            if input.isEmpty {
                all.append(sameDay)
                break
            } else if !Calendar.current.isDate(sameDay.last!.dt, inSameDayAs: input.first!.dt) {
                all.append(sameDay)
                sameDay = [Forecast]()
            }
        }
        return all
    }
}
