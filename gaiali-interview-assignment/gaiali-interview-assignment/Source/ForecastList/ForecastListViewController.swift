//
//  ForecastListViewController.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import UIKit

class ForecastListViewController: BaseViewController {
    var viewModel: ForecastListViewModel!
    let textField = UITextField().autolayoutView
    let tableView = UITableView().autolayoutView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func setViews() {
        super.setViews()
        textField.backgroundColor = appTheme.primaryColor
        textField.tintColor = appTheme.primaryInvertColor
        textField.attributedPlaceholder = NSAttributedString(string: Strings.ForecastList.City.placeholder,
                                                             attributes: [.foregroundColor: appTheme.primaryInvertColor])
        textField.textColor = appTheme.primaryInvertColor
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.delegate = self
        view.addSubview(textField)
        
        tableView.register(ForecastCell.self, forCellReuseIdentifier: ForecastCell.reuseIdentifier)
        tableView.dataSource = viewModel.tableDataSource
        view.addSubview(tableView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        [textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         textField.bottomAnchor.constraint(equalTo: tableView.topAnchor),
         textField.heightAnchor.constraint(equalToConstant: 50),
         tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)]
            .forEach { $0.isActive = true }
    }
}

extension ForecastListViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text, !city.isEmpty {
            self.showActivityIndicator()
            self.viewModel.load(for: city) { _ in
                self.hideActivityIndicator()
                self.tableView.reloadData()
            }
        } else {
            self.viewModel.clear()
            self.tableView.reloadData()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
