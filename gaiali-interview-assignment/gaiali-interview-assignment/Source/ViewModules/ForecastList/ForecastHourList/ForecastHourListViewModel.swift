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
    
    init(forecasts: [Forecast], units: Units) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        forecastCollectionDataSource.cellViewModels = forecasts.map({ hourForecast in
            ForecastCollectionCellModel(temperature: "\(Int(hourForecast.main.temp.rounded()))\(units.tempUnit)",
                                        time: dateFormatter.string(from: hourForecast.dt),
                                        iconPlaceholder: UIImage(systemName: "photo")!,
                                        iconUrl: hourForecast.weather.first!.iconUrl)
        })
    }
}
