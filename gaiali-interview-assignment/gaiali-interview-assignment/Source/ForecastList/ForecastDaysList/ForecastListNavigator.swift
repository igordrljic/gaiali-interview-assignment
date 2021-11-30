//
//  ForecastListNavigator.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import Foundation
import UIKit

class ForecastListNavigator {
    let forecastListViewController: ForecastListViewController
    
    init() {
        forecastListViewController = ForecastListViewController()
        forecastListViewController.viewModel = ForecastListViewModel(forecastProvider: ForecastWebProvider())
    }
}
