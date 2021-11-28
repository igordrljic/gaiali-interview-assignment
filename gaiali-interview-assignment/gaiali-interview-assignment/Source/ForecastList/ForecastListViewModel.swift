//
//  ForecastListViewModel.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import UIKit

class ForecastListViewModel {
    private let forecastTableDataSource = ForecastTableDataSource()
    private let forecastProvider: ForecastProvider
    private let units: Units
    
    var tableDataSource: UITableViewDataSource {
        forecastTableDataSource
    }
    
    init(forecastProvider: ForecastProvider, units: Units = .metric) {
        self.forecastProvider = forecastProvider
        self.units = units
    }
    
    func load(for city: String, completion: @escaping (Error?) -> Void) {
        forecastProvider.getForecast(for: city, units: units) { result in
            switch result {
            case let .success(forecast):
                self.update(with: forecast)
                completion(nil)
            case let .failure(error):
                self.clear()
                completion(error)
            }
        }
    }
    
    func clear() {
        forecastTableDataSource.sectionTitles = []
        forecastTableDataSource.cellViewModels = []
    }
    
    private func update(with forecast: ForecastResponse) {
        let forecastByDay = divideByDay(forecast.list)
        fillSectionTitles(with: forecastByDay)
        fillCellViewModels(with: forecastByDay)
        debugPrint(forecastTableDataSource.sectionTitles)
        debugPrint(forecastTableDataSource.cellViewModels)
    }
    
    private func fillSectionTitles(with forecasts: [[Forecast]]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        forecastTableDataSource.sectionTitles = forecasts.map({
            dateFormatter.string(from: $0.first!.dt)
        })
    }
    
    private func fillCellViewModels(with forecasts: [[Forecast]]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        forecastTableDataSource.cellViewModels = forecasts.map({ forecastsForDay in
            forecastsForDay.map({ forecastsForTime in
                ForecastCellViewModel(temperature: "\(Int(forecastsForTime.main.temp.rounded()))\(units.tempUnit)",
                                      time: dateFormatter.string(from: forecastsForTime.dt),
                                      icon: forecastsForTime.weather.first?.icon)
            })
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
