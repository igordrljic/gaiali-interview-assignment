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
        
    private init() {}
    
    func start(with window: UIWindow) {
        self.window = window
        window.overrideUserInterfaceStyle = AppThemeManager.systemUserInterfaceStyle
        let viewController = BaseViewController()
        viewController.view.backgroundColor = .yellow
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
