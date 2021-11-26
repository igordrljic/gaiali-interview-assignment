//
//  BaseViewController.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import UIKit

class BaseViewController: UIViewController {
    var appTheme: AppTheme {
        AppThemeManager.shared.theme
    }
    private lazy var activityIndicator = UIActivityIndicatorView(style: .large).autolayoutView
    
    func setViews() {
        activityIndicator.color = appTheme.primaryColor
        activityIndicator.tintColor = appTheme.primaryColor
        activityIndicator.backgroundColor = appTheme.backgroundColor
        activityIndicator.isUserInteractionEnabled = false
        activityIndicator.clipsToBounds = true
        activityIndicator.layer.cornerRadius = 5
        activityIndicator.alpha = 0.8
        view.addSubview(activityIndicator)
    }
    
    func setConstraints() {
        [activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         activityIndicator.widthAnchor.constraint(equalToConstant: 100),
         activityIndicator.heightAnchor.constraint(equalToConstant: 100)]
            .forEach {
                $0.isActive = true
            }
    }
    
    func showActivityIndicator() {
        view.isUserInteractionEnabled = false
        activityIndicator.superview?.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        activityIndicator.superview?.sendSubviewToBack(activityIndicator)
        view.isUserInteractionEnabled = true
    }
    
    func presentAlert(for error: Error) {
        let alert = UIAlertController(title: Strings.PresentableError.title,
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: Strings.General.ok,
                               style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
