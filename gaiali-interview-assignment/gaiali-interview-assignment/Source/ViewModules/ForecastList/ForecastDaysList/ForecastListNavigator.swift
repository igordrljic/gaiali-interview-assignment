//
//  ForecastListNavigator.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import Foundation
import UIKit

class ForecastListNavigator {
    let forecastListViewController: ForecastDaysListViewController
    
    init() {
        forecastListViewController = ForecastDaysListViewController()
        forecastListViewController.viewModel = ForecastDaysListViewModel(forecastProvider: ForecastWebProvider(),
                                                                         units: Units.defaultValue)
    }
}
