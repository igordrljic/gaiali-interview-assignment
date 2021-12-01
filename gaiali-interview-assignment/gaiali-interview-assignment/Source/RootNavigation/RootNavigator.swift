//
//  RootNavigator.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import UIKit

class RootNavigator {
    static let shared = RootNavigator()
    var window: UIWindow!
        
    let forecastListNavigator = ForecastListNavigator()
    
    private var appTheme: AppTheme {
        AppThemeManager.shared.theme
    }
    
    private init() {}
    
    func start(with window: UIWindow) {
        self.window = window
        let viewController = forecastListNavigator.forecastListViewController
        viewController.navigationItem.title = Strings.ForecastList.title
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.view.backgroundColor = appTheme.backgroundColor
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
