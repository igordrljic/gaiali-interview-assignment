//
//  ForecastDaysListViewModel.swift
//  gaiali-interview-assignment-unit-tests
//
//  Created by Igor Drljic on 30.11.21..
//

import Foundation
import XCTest
@testable import gaiali_interview_assignment

class ForecastDaysListViewModelTest: XCTestCase {
    
    func testForecastDaysListViewModel() throws {
        let numberOfDays = 6
        let expectation = expectation(description: "Loading ForecastDaysListViewModel")
        let viewModel = ForecastDaysListViewModel(forecastProvider: ForecastJSONMockProvider(), units: .metric)
        viewModel.load(for: "Belgrade") { result in
            switch result {
            case .success:
                XCTAssertEqual(viewModel.forecastTableDataSource.sectionTitles.count, numberOfDays)
            case let .failure(error):
                XCTFail(String(describing: error))
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: defaultTimeout)
    }
    
    func testForecastHoursListViewModel() throws {
        let forecastItemCount = 40
        let expectation = expectation(description: "Loading ForecastHoursListViewModel")
        let viewModel = ForecastHourListViewModel(forecastProvider: ForecastJSONMockProvider(),
                                                  city: "Belgrade",
                                                  units: .metric)
        viewModel.load { result in
            switch result {
            case .success:
                XCTAssertEqual(viewModel.forecastCollectionDataSource.cellViewModels.count, forecastItemCount)
            case let .failure(error):
                XCTFail(String(describing: error))
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: defaultTimeout)
    }
}
