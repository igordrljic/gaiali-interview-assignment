//
//  ForecastDaysListViewController.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 28.11.21..
//

import UIKit

extension ForecastDaysListViewController {
    enum Segment: Int {
        case web
        case json
        
        var title: String {
            switch self {
            case .web:
                return Strings.ForecastList.Segment.web
            case .json:
                return Strings.ForecastList.Segment.json
            }
        }
    }
}

class ForecastDaysListViewController: BaseViewController {
    var viewModel: ForecastDaysListViewModel!
    let textField = UITextField().autolayoutView
    let tableView = UITableView().autolayoutView
    let segmentedControl = UISegmentedControl(items: [Segment.web.title, Segment.json.title]).autolayoutView
    private let refreshControl = UIRefreshControl()
    private let padding: CGFloat = 10
    
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
        
        refreshControl.tintColor = appTheme.primaryColor
        refreshControl.isHidden = true
        refreshControl.addTarget(self, action: #selector(reloadAction), for: .valueChanged)
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        set(segment: .web)
        view.addSubview(segmentedControl)
        
        textField.backgroundColor = appTheme.primaryColor
        textField.tintColor = appTheme.primaryInvertColor
        textField.attributedPlaceholder = NSAttributedString(string: Strings.ForecastList.City.placeholder,
                                                             attributes: [.foregroundColor: appTheme.primaryInvertColor.withAlphaComponent(0.4)])
        textField.textColor = appTheme.primaryInvertColor
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.delegate = self
        view.addSubview(textField)
        
        tableView.register(ForecastTableCell.self, forCellReuseIdentifier: ForecastTableCell.reuseIdentifier)
        tableView.dataSource = viewModel.forecastTableDataSource
        tableView.refreshControl = refreshControl
        tableView.keyboardDismissMode = .interactive
        view.addSubview(tableView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        [segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
         segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
         segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
         textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         textField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: padding),
         textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         textField.bottomAnchor.constraint(equalTo: tableView.topAnchor),
         textField.heightAnchor.constraint(equalToConstant: 50),
         tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)]
            .forEach { $0.isActive = true }
    }
    
    @objc
    private func reloadAction() {
        loadForecast(isRefreshing: true)
    }
    
    private func loadForecast(isRefreshing: Bool = false) {
        if let city = readSearchText(from: textField) {
            if isRefreshing {
                refreshControl.isHidden = false
            } else {
                self.showActivityIndicator()
            }
            viewModel.load(for: city) { result in
                if isRefreshing {
                    self.refreshControl.endRefreshing()
                    self.refreshControl.isHidden = true
                } else {
                    self.hideActivityIndicator()
                }
                if case let .failure(error) = result {
                    self.presentAlert(for: error)
                }
                self.tableView.reloadData()
            }
        } else {
            if isRefreshing {
                self.refreshControl.endRefreshing()
            }
            self.viewModel.clear()
            self.tableView.reloadData()
        }
    }
    
    private func readSearchText(from textField: UITextField) -> String? {
        guard let searchText = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !searchText.isEmpty
        else { return nil }
        return searchText
    }
    
    private func set(segment: Segment) {
        viewModel.setForecastProvider(for: segment)
        segmentedControl.selectedSegmentIndex = segment.rawValue
    }
    
    @objc
    private func segmentedControlValueChanged(_ segmentedControl: UISegmentedControl) {
        let selectedSegment = Segment(rawValue: segmentedControl.selectedSegmentIndex)!
        viewModel.setForecastProvider(for: selectedSegment)
        loadForecast()
    }
}

extension ForecastDaysListViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        loadForecast()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
