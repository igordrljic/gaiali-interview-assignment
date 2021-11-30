//
//  ForecastJSONMockProviderTest.swift
//  gaiali-interview-assignment-unit-tests
//
//  Created by Igor Drljic on 26.11.21..
//

import XCTest
@testable import gaiali_interview_assignment

class ForecastJSONMockProviderTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJSONMockProvierFetch() throws {
        let expectation = expectation(description: "Fetching forecast")
        let provider = ForecastJSONMockProvider()
        provider.getForecast(for: "Belgrade", units: .metric) { result in
            switch result {
            case let .success(forecast):
                XCTAssertEqual(forecast.count, 40)
            case let .failure(error):
                XCTFail(String(describing: error))
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: defaultTimeout)
    }
}
